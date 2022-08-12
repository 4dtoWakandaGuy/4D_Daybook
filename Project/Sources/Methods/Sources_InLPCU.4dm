//%attributes = {}
If (False:C215)
	//Project Method Name:      Sources_InLPCU
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/03/2010 12:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_CodeNumbers; 0)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; vLayer; vProduct)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sources_InLPCU")
RELATE ONE:C42([SOURCES:6]Publication_Code:12)
vLayer:=[PUBLICATIONS:52]Publication_Name:2
RELATE ONE:C42([SOURCES:6]Product_Code:6)
vProduct:=[PRODUCTS:9]Product_Name:2
If ([SOURCES:6]Person:9="")
	[SOURCES:6]Person:9:=<>PER_t_CurrentUserInitials
End if 
If ([SOURCES:6]Source_Date:3=!00-00-00!)
	[SOURCES:6]Source_Date:3:=<>DB_d_CurrentDate
End if 
ARRAY LONGINT:C221($_al_CodeNumbers; 3)
$_al_CodeNumbers{1}:=1
$_al_CodeNumbers{2}:=2
$_al_CodeNumbers{3}:=4
Gen_CULPB(->[SOURCES:6]Source_Code:1; 4; ->$_al_CodeNumbers; "Contacts"; "Companies"; "Orders")
ERR_MethodTrackerReturn("Sources_InLPCU"; $_t_oldMethodName)