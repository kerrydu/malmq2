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

{synopt:{opt vrs}}specifies decomposing TFP under the production technology with variable returns to scale. By default, production technology with constant returns to scale is assumed.
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

{phang}
The malmq2 program requires initial data set that contains the input and output variables for observed units. 

{phang}
Variable names must be identified by inputvars for input variable, by outputvars for output variable 
 to allow that {cmd:malmq2} program can identify and handle the multiple input-output data set.



{title:Examples}

{phang}{"use ...\example_ddf.dta"}

{phang}{cmd:. malmq2 K L= Y, id( dmu ) time(year) global}

{phang}{cmd:. malmq2 K L= Y, id( dmu ) time(year) seq ort(o)}

{phang}{cmd:. malmq2 K L= Y, id( dmu ) time(year) ort(o) sav(tfp_result,replace)}

{title:Saved Results}

{psee}
Macro:

{psee}
{cmd: r(file)} the filename stores results of {cmd:malmq2}.
{p_end}



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
