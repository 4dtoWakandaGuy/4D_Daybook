If (False:C215)
	//object Name: [COMPANIES]Companies_Out.Variable7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(COM_at_CompanyTypes;0)
	C_LONGINT:C283($_l_CompanyTypeRow; VNo)
	C_TEXT:C284($_t_oldMethodName; CUR_CompanyTypes)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Companies_Out.Variable7"; Form event code:C388)
If (COM_at_CompanyTypes>0)
	$_l_CompanyTypeRow:=COM_at_CompanyTypes
	If (COM_at_CompanyTypes>0)
		USE SET:C118("CMaster")
		
		CREATE SET:C116([COMPANIES:2]; "T1")
		Case of 
			: (COM_at_CompanyTypes=1)  //COmpanies
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Private:37#True:C214)
				CREATE SET:C116([COMPANIES:2]; "T2")
			: (COM_at_CompanyTypes=2)  //people
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Private:37=True:C214)
				CREATE SET:C116([COMPANIES:2]; "T2")
			Else 
				ALL RECORDS:C47([COMPANIES:2])
				CREATE SET:C116([COMPANIES:2]; "T2")
		End case 
		INTERSECTION:C121("T1"; "T2"; "T1")
		USE SET:C118("T1")
		CLEAR SET:C117("T1")
		CLEAR SET:C117("T2")
		
	End if 
	
	
	If (Records in selection:C76([COMPANIES:2])=0)
		Gen_Alert("No "+COM_at_CompanyTypes{COM_at_CompanyTypes}+" found-the selection is empty"; "OK")
	End if 
	
	
	//FS_SetFormSort (WIN_t_CurrentOutputform)
	Case of 
		: (COM_at_CompanyTypes=1)
			CUR_CompanyTypes:="Companies"
		: (COM_at_CompanyTypes=2)
			CUR_CompanyTypes:="Private Individuals"  //Rollo 9/7/2004
		: (COM_at_CompanyTypes=4)
			CUR_CompanyTypes:="Companies and Private Individuals"  //Rollo 9/7/2004
	End case 
	
End if 
VNo:=Records in selection:C76([COMPANIES:2])
ERR_MethodTrackerReturn("OBJ [COMPANIES].Companies_Out.Variable7"; $_t_oldMethodName)
