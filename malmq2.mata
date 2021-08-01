* 2 Nov 2019
version 16
// Versioning
_get_version malmq2
assert("`package_version'" != "")
mata: string scalar malmq2_version() return("`package_version'")
mata: string scalar malmq2_stata_version() return("`c(stata_version)'")
mata: string scalar malmq2_joint_version() return("`package_version'|`c(stata_version)'")

cap mata mata drop sdf_i()
cap mata mata drop sdf_o()
mata:
mata clear 


    void function sdf_o(string scalar d, ///
                        string scalar touse, ///
						string scalar rflag, ///
						real scalar k,   ///
						real scalar scale, ///
						string scalar g, ///
						real scalar  maxiter, ///
						real scalar  tol)
    { 
          data=st_data(.,d,touse)
          data=data'
          dataref=st_data(.,d,rflag)
          dataref=dataref'
          M=rows(data)
          Xref=dataref[1..k,.]
          Yref=dataref[k+1..M,.]
          X=data[1..k,.]
          Y=data[k+1..M,.]
          N=cols(dataref)
  
          class LinearProgram scalar q
          q = LinearProgram()
		  
			if(maxiter!=-1){
			  q.setMaxiter(maxiter)
			}
			if (tol!=-1){
			  q.setTol(tol)
			}			  
		  
          c = (1, J(1,N,0))
          lowerbd =., J(1,N,0)
          upperbd = J(1,N+1,.)
		  if(scale==1){
            Aec= (0, J(1,N,1))
            q.setEquality(Aec, 1)
		   }
		  
          theta=J(cols(data),1,.)
  
          for(j=1;j<=cols(data);j++){
              A1 = (J(k,1,0),Xref)
              b1 = (X[.,j])
              A2 = (Y[.,j],-Yref)
              b2=J(M-k,1,0)
              Aie=A1 \ A2
              bie=b1 \ b2
              q.setCoefficients(c)
              q.setInequality(Aie, bie)
              q.setBounds(lowerbd, upperbd)
              theta[j]=q.optimize()		  
         }
          st_view(gen=.,.,g,touse)
          gen[.,.]=theta
    
    }



void function sdf_i(string scalar d, ///
                    string scalar touse, ///
					string scalar rflag, ///
					real scalar k, ///
					real scalar scale, ///
					string scalar g, ///
					real scalar  maxiter, ///
				    real scalar  tol)
    { 
          data=st_data(.,d,touse)
          data=data'
          dataref=st_data(.,d,rflag)
          dataref=dataref'
          M=rows(data)
          Xref=dataref[1..k,.]
          Yref=dataref[k+1..M,.]
          X=data[1..k,.]
          Y=data[k+1..M,.]
          N=cols(dataref)
  
          class LinearProgram scalar q
          q = LinearProgram()
		  q.setMaxOrMin("min")
			if(maxiter!=-1){
			  q.setMaxiter(maxiter)
			}
			if (tol!=-1){
			  q.setTol(tol)
			}			  
          c = (1, J(1,N,0))
          lowerbd =., J(1,N,0)
          upperbd = J(1,N+1,.)		  
		  if(scale==1){
            Aec= (0, J(1,N,1))
            q.setEquality(Aec, 1)
		   }  
          theta=J(cols(data),1,.)
  
          for(j=1;j<=cols(data);j++){
              A1 = (-X[.,j],Xref)
              b1 = J(k,1,0)
              A2 = (J(M-k,1,0),-Yref)
              b2=  -Y[.,j]
              Aie=A1 \ A2
              bie=b1 \ b2
              q.setCoefficients(c)
              q.setInequality(Aie, bie)
              q.setBounds(lowerbd, upperbd)
              theta[j]=q.optimize()		  
         }
          st_view(gen=.,.,g,touse)
          gen[.,.]=theta
    
    }

end

