//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_CompanySu
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(vAutoFind)
	C_LONGINT:C283(xNew)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_oldMethodName; $1; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vCompCode; vContCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_CompanySu")
//Check_Company SU
vCompCode:=""
xNew:=0
$1:=Check_QM($1)
QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$1)
If ((Records in selection:C76([COMPANIES:2])=1) & ([COMPANIES:2]Company_Code:1=$1) & (Character code:C91(Substring:C12($1; Length:C16($1); 1))#64))
Else 
	vAutoFind:=False:C215
	Comp_Sel2($1)
End if 
If (Records in selection:C76([COMPANIES:2])>1)
	Check_DispNum(->[COMPANIES:2]; "Companies")
	If (OK=1)
		$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
		DB_t_CurrentFormUsage:="NC"
		vContCode:=""
		Check_Company2
		//_O_ENABLE BUTTON(xNew)
		OBJECT SET ENABLED:C1123(xNew; True:C214)
		DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
	End if 
Else 
	If (Records in selection:C76([COMPANIES:2])=1)
		vCompCode:=[COMPANIES:2]Company_Code:1
	End if 
End if 
If (Records in selection:C76([COMPANIES:2])=0)
	Gen_Alert("No Companies found"; "Try Again")
End if 
ERR_MethodTrackerReturn("Check_CompanySu"; $_t_oldMethodName)