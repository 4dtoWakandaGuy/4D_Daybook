//%attributes = {}
If (False:C215)
	//Project Method Name:      Minor_SelP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  12/06/2010 18:01
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vContr; SRCH_l_And; SRCH_l_Not; SRCH_l_or)
	C_POINTER:C301($1; $2; $3; vFilePtr)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; $_t_SearchAt; vCompCode; vCompName; VSELPREV; vTitle13)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Minor_SelP")
//Minor_SelP

Sel_Beginning(False:C215; $1)
vContr:=1
While ((vContr=1) & ((SRCH_l_And=1) | (SRCH_l_or=1) | (SRCH_l_Not=1)))
	Sel_Beginning2(False:C215; ->[SCRIPTS:80])
	
	If (vSelPrev#"•FSC")
		vCompCode:=""
		vCompName:=""
		vFilePtr:=$1
		vTitle13:="vCompCode+vContName+"
	End if 
	Open_AnyTypeWindow(277; 428; 4; "Find")
	SET MENU BAR:C67(57)
	
	DIALOG:C40([AREAS:3]; "dMinor_Sel")
	CLOSE WINDOW:C154
	
	If (OK=0)
		vContr:=0
	Else 
		Sel_S($1; $2; vCompCode)
		Sel_SIS
		Sel_SSStrSin($1; $3; vCompName)
		Big_One($1)
	End if 
End while 
Sel_Ending
ERR_MethodTrackerReturn("Minor_SelP"; $_t_oldMethodName)