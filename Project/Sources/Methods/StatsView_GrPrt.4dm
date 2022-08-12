//%attributes = {}
If (False:C215)
	//Project Method Name:      StatsView_GrPrt
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/11/2012 15:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_OK; ch2; ch3; ch4)
	C_PICTURE:C286(WS_PiC_Chart)
	C_TEXT:C284($_t_oldMethodName; vTitle1; vTitle12; vTitle3; vTitle4; vTitle6; vTitle7; vTitle8; vTitle9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView_GrPrt")
//StatsView PrtGr aph
vTitle1:=Uppercase:C13(vTitle1)
vTitle1:=Request:C163("Graph Title: "; vTitle1)
If (OK=1)
	vTitle12:="Analysis by "+vTitle3+",  showing "+vTitle4+" "
	If (ch2=1)
		vTitle12:=vTitle12+": Count"
	Else 
		vTitle12:=vTitle12+" :"
		If (ch3=1)
			vTitle12:=vTitle12+vTitle6+" "+vTitle7
			If (ch4=1)
				vTitle12:=vTitle12+" and "
			End if 
		End if 
		If (ch4=1)
			vTitle12:=vTitle12+vTitle8+" "+vTitle9
		End if 
	End if 
	$_l_OK:=PRINT_SetSIZE("A4"; "L"; Vtitle1)
	If ($_l_OK>=0)  // NG Feb 2005 added this conditional-see inside Print_setSize about it
		//PAGE SETUP([COMPANIES];"SV_GraphPrt")
		//PRINT SETTINGS
		//WS_PiC_Chart:= DB_CreateSVGgraph(Vgraph;-1)
		Print form:C5([COMPANIES:2]; "SV_GraphPrt")
		PAGE BREAK:C6
		PRT_SetPrinterPaperOptions(Vtitle1)  //NG June 2005
	End if 
End if 
ERR_MethodTrackerReturn("StatsView_GrPrt"; $_t_oldMethodName)
