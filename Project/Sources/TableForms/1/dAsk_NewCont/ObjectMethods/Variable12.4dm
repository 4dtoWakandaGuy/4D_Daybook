If (False:C215)
	//object Name: [CONTACTS]dAsk_NewCont.Variable12
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(r1; r2)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_oldMethodName; DB_t_CurrentFormUsage; VCompCode; vCompName; VPostCode; VTown)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].dAsk_NewCont.Variable12"; Form event code:C388)
If (vCompName#"")
	$_t_CurrentFormUsage:=DB_t_CurrentFormUsage  //NG October 2004
	
	DB_t_CurrentFormUsage:="NC"
	Check_Company(->vCompName; ->[CONTACTS:1]Contact_Code:2; ->[CONTACTS:1]; False:C215; True:C214)
	DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
	
	If (VCompCode#"")
		If ([COMPANIES:2]Company_Code:1#VCompCode)
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=vCompCode)
		End if 
		
		VTown:=[COMPANIES:2]Town_or_City:5
		VPostCode:=[COMPANIES:2]Postal_Code:7
		r2:=1
		r1:=0
		
	Else 
		VCompName:=""
		VTown:=""
		VPostCode:=""
		r2:=0
		r1:=1
	End if 
	
	
Else 
	r2:=0
	r1:=1
End if 
ERR_MethodTrackerReturn("OBJ [CONTACTS].dAsk_NewCont.Variable12"; $_t_oldMethodName)
