{smcl}
{* *! version 0.3  29 Oct 2019}{...}
{cmd:help malmq2}
{hline}

{title:Title}

{phang}
{bf:malmq2} {hline 2} Malmquist Productivity index in Stata 

{title:Syntax}

{p 8 21 2}
{cmd:malmq2} {it:{help varlist:inputvars}} {cmd:=} {it:{help varlist:outputvars}} {ifin} 
{cmd:,} {cmdab:id(}{varname}{cmd:)} {cmdab:t:ime(}{varname}{cmd:)} [{it:options}]

{synoptset 28 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Main}
{synopt:{cmdab:id(varname)}}specifies names of DMUs. It is required. 

{synopt:{cmdab:t:ime:(varname)}}specifies time period for contemporaneous production technology. It is required. 
{p_end}

{synopt:{cmdab:seq:uential}}specifies sequential production technology.
{p_end}

{synopt:{cmdab:win:dow(#)}}specifies window production technology with # periods.
{p_end}

{synopt:{opt global}}specifies global production technology.
{p_end}

{synopt:{opt fngz}}specifies decomposing TFP change using the FNGZ's (1994) method.
{p_end}

{synopt:{opt rd}}specifies decomposing TFP change using the RD's (1997) method.
{p_end}

{synopt:{opt ort(string)}}specifies the oriention. The default is ort(i), 
meaning the input oriented productivity index. ort(out) means the output oriented productivity index.
{p_end}

{synopt:{opt sav:ing(filename[,replace])}}specifies that the results be saved in {it:filename}.dta. 
{p_end}

{synopt:{opt maxiter(#)}}specifies the maximum number of iterations, which must be an integer greater than 0. The default value of maxiter is 16000.
{p_end}

{synopt:{opt tol(real)}}specifies the convergence-criterion tolerance, which must be greater than 0.  The default value of tol is 1e-8.
{p_end}

{synoptline}
{p2colreset}{...}


{title:Description}

{pstd}
{cmd:malmq2} selects the input and output variables in the opened data set and estimate Malmquist Productivity Index using Data Envelopment Analysis(DEA) frontier by options specified. 



{title:Examples}

{phang}{"use ...\example_ddf.dta"}

{phang}{cmd:. malmq2 K L= Y, id( dmu ) time(year) global}

{phang}{cmd:. malmq2 K L= Y, id( dmu ) time(year) seq ort(o) fgnz}

{phang}{cmd:. malmq2 K L= Y, id( dmu ) time(year) ort(o) rd sav(tfp_result,replace)}

{title:Saved Results}

{psee}
Macro:

{psee}
{cmd: r(file)} the filename stores results of {cmd:malmq2}.
{p_end}


{marker references}{...}
{title:References}
 
{phang}
Färe, R., Grosskopf, S., Norris, M., & Zhang, Z. (1994). Productivity Growth, Technical Progress, and Efficiency Change in Industrialized Countries. The American Economic Review, 84(1), 66-83.

{phang}
Ray, S., & Desli, E. (1997). Productivity Growth, Technical Progress, and Efficiency Change in Industrialized Countries: Comment. The American Economic Review, 87(5), 1033-1039.

{phang}
Pastor, J., Lovell, C. (2005). A global Malmquist productivity index, Economics Letters, 88(2):266-271.

{phang} 
Ji, Y., Lee, C. (2010). Data Envelopment Analysis. Stata Journal 10: 267-280.

{phang}
Lee, K., Lee,B., Lee, C., Lee, C. (2011). Malmquist Productivity Index using DEA frontier in Stata. Working paper.



{title:Author}

{psee}
Kerry Du

{psee}
Xiamen University

{psee}
Xiamen, China

{psee}
E-mail: kerrydu@xmu.edu.cn
{p_end}
