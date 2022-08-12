//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_PrLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_Event)
	C_TEXT:C284($_t_oldMethodName; vArea; vComments; vCompany; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vPerson; vSource; vStatus; vTele)
	C_TEXT:C284(vType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_PrLP")

//Lp Companies_Print
$_l_Event:=Form event code:C388


If ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
	
	
	vCompany:=[COMPANIES:2]Company_Code:1
	RELATE ONE:C42([COMPANIES:2]Sales_Person:29)
	vPerson:=[PERSONNEL:11]Name:2
	RELATE ONE:C42([COMPANIES:2]Taken_By:26)
	vTele:=[PERSONNEL:11]Name:2
	Company_Details
	CompCont_Srch
	RELATE ONE:C42([COMPANIES:2]Status:12)
	vStatus:=[STATUS:4]Status_Name:2
	RELATE ONE:C42([COMPANIES:2]Company_Type:13)
	vType:=[TYPES:5]Type_Name:2
	RELATE ONE:C42([COMPANIES:2]Source:14)
	vSource:=[SOURCES:6]Source_Name:2
	RELATE ONE:C42([COMPANIES:2]Area:11)
	vArea:=[AREAS:3]Area_Name:2
	vComments:=[COMPANIES:2]Comments:30
	If (DB_t_CurrentFormUsage#"NoSearch")
		Comp_ListDry
	End if 
End if 
ERR_MethodTrackerReturn("Companies_PrLP"; $_t_oldMethodName)