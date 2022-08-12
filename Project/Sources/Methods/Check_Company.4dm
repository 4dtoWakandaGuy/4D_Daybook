//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_Company
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/12/2009 14:47`Method: Check_Company
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Address_Status)
	C_BOOLEAN:C305(<>MultiCo; $_bo_Continue; $_bo_HideWIndow; $_bo_LookinContactCompanies; $_bo_OK; $_bo_ReadOnlyState; $4; $5; $6; vAutoFind; vFromIn)
	C_LONGINT:C283($_l_AddMode; $_l_CM; $_l_DataType; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; vAdd; vCM; xNew)
	C_POINTER:C301($1; $2; $3)
	C_TEXT:C284(<>SYS_t_AccessType; <>SYS_t_DefaultTelFormat; $_t_AccessType; $_t_CloseSave; $_t_CompanyCode; $_t_CompanyCode2; $_t_CurrentFormUsage2; $_t_oldMethodName; $_t_ParentCompanyCode; $_t_Search; COM_t_TelephoneNumberFormat)
	C_TEXT:C284(DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; SYS_t_AccessType; vCompCode; vCompName; vContCode; vLayCode; vTel; WIN_t_CurrentInputForm)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("Check_Company")
//Check_Company
If (Count parameters:C259>=4)
	//we are going to only look in the current selection
	If ($4)
		CREATE SET:C116([COMPANIES:2]; "Tr1")
	Else 
		ALL RECORDS:C47([COMPANIES:2])
		CREATE SET:C116([COMPANIES:2]; "Tr1")
	End if 
End if 
If (Count parameters:C259>=5)
	$_bo_HideWIndow:=$5  //NG  Modified March 2004
	
Else 
	$_bo_HideWIndow:=False:C215
End if 


If ($1->#"")
	
	$1->:=Check_QM($1->)
	
	$_t_CloseSave:=DB_t_CallOnCloseorSave
	xNew:=0
	If (Length:C16($1->)>0)
		If (Character code:C91($1->[[1]])=64)
			ALL RECORDS:C47([COMPANIES:2])
		Else 
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$1->; *)
			QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Deleted:61=0)
		End if 
	Else 
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$1->; *)
		QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Deleted:61=0)
	End if 
	
	
	If ((Records in selection:C76([COMPANIES:2])=1) & ([COMPANIES:2]Company_Code:1=$1->) & (Character code:C91(Substring:C12($1->; Length:C16($1->); 1))#64))
		If (Count parameters:C259>=4)
			If (Is in set:C273("Tr1"))
				$1->:=Uppercase:C13($1->)
				$_bo_Continue:=False:C215
			Else 
				$_bo_Continue:=True:C214
			End if 
		Else 
			$_bo_Continue:=False:C215
			$1->:=Uppercase:C13($1->)
		End if 
	Else 
		$_bo_Continue:=True:C214
	End if 
	
	If ($_bo_Continue)
		$_l_DataType:=Type:C295($2->)
		If ($_l_DataType=Is alpha field:K8:1)
			$_bo_OK:=(Table:C252($2)#2)
			
		Else 
			$_bo_OK:=True:C214
		End if 
		If (Count parameters:C259>=6)
			//We dont want to do a look up in the contact companies if this is adding a contact company code
			$_bo_LookinContactCompanies:=$6
		Else 
			$_bo_LookinContactCompanies:=True:C214
		End if 
		
		If (($2->#"") & (<>MultiCo) & ($_bo_OK)) & ($_bo_LookinContactCompanies)  //1
			If ([CONTACTS:1]Contact_Code:2#$2->)
				
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$2->)
			End if 
			$_t_Search:=Sel_AtSign($1->)
			QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
			QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
			QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$_t_Search)
			If (Records in selection:C76([CONTACTS_COMPANIES:145])>0)  //3
				
				Check_MultiCo($2; $1; $3)
				If (Records in selection:C76([COMPANIES:2])=0)  // user entered part of a company name
					vAutoFind:=False:C215
					vLayCode:=$1->
					Comp_Sel2($1->; "1")
				End if 
			Else 
				vAutoFind:=False:C215
				If (Table:C252($3)=1)  //4
					Comp_Sel2($1->; "1")
				Else 
					vLayCode:=$1->
					//Loaded in to allow Check_ContDef to put in the right Cont if srch here by Cont
					Comp_Sel2($1->)
				End if   //4
			End if   //3
		Else 
			vAutoFind:=False:C215
			If (Table:C252($3)=1)  //5
				Comp_Sel2($1->; "1")
			Else 
				vLayCode:=$1->
				//Loaded in to allow Check_ContDef to put in the right Cont if srch here by Cont
				Comp_Sel2($1->)
				
			End if   //5
		End if   //1
		
		If (Records in selection:C76([COMPANIES:2])>1)  //6
			If (Count parameters:C259>=4)
				CREATE SET:C116([COMPANIES:2]; "Tr2")
				INTERSECTION:C121("Tr2"; "Tr1"; "Tr2")
				USE SET:C118("Tr2")
				CLEAR SET:C117("Tr2")
			End if 
			Check_DispNum(->[COMPANIES:2]; "Companies")
			If (OK=1)  //7
				$_t_CurrentFormUsage2:=DB_t_CurrentFormUsage2
				If (Table:C252($3)=1)  //8
					DB_t_CurrentFormUsage2:="Contact"
				End if   //8
				vContCode:=$2->
				If ($_bo_HideWIndow)
					HIDE WINDOW:C436
				End if 
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
				If ($_l_WindowTop>0)
					Check_Company2($_l_WindowLeft+10; $_l_WindowTop)
				Else 
					Check_Company2
				End if 
				
				If ($_bo_HideWIndow)
					SHOW WINDOW:C435
				End if 
				WS_KeepFocus
				
				If (OK=0)  //9
					GOTO OBJECT:C206($1->)
				End if   //9
				//        _O_ENABLE BUTTON(xNew)
				OBJECT SET ENABLED:C1123(xNew; True:C214)
				DB_t_CurrentFormUsage2:=$_t_CurrentFormUsage2
			Else 
				GOTO OBJECT:C206($1->)
			End if   //7
		Else 
			If (Records in selection:C76([COMPANIES:2])=1)  //10
				If (Count parameters:C259>=4)
					If (Is in set:C273("Tr1"))
						//$1->:=Uppercase($1->)
						$_bo_Continue:=True:C214
					Else 
						$_bo_Continue:=False:C215
					End if 
				Else 
					$_bo_Continue:=True:C214
					
				End if 
				If ($_bo_Continue)
					vCompCode:=[COMPANIES:2]Company_Code:1
					//Check on Superior
					If (([COMPANIES:2]Superior:34#"") & (DB_t_CurrentFormUsage="IS"))  //11
						$_t_ParentCompanyCode:=[COMPANIES:2]Superior:34
						$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
						COPY NAMED SELECTION:C331([COMPANIES:2]; "Companies")
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_ParentCompanyCode)
						If (Records in selection:C76([COMPANIES:2])=1)  //12
							Gen_Confirm($_t_CompanyCode+" has a 'Superior' as follows:"+Char:C90(13)+[COMPANIES:2]Company_Code:1+"  "+[COMPANIES:2]Company_Name:2+Char:C90(13)+Char:C90(13)+"Which do you want to use?"; "As selected"; "Superior")
							If (OK=1)  //13
								USE NAMED SELECTION:C332("Companies")
							Else 
								vCompCode:=[COMPANIES:2]Company_Code:1
							End if   //13
						Else   //12
							USE NAMED SELECTION:C332("Companies")
						End if   //12
						CLEAR NAMED SELECTION:C333("Companies")
					End if   //11
					//
				End if 
				
			End if   //10
			
			If ((Records in selection:C76([COMPANIES:2])=0) & (DB_GetModuleSettingByNUM(Module_Companies)#3) & (DB_t_CurrentFormUsage#"NC"))  //13
				Gen_Confirm("That Company does not exist.  Do you want to create it?"; "Try again"; "Create it")
				If (OK=1)  //15
					OK:=0
					vCompCode:=""
					GOTO OBJECT:C206($1->)
				Else 
					OK:=1
				End if   //15
			End if   //13
		End if   //6
		If ((Records in selection:C76([COMPANIES:2])=0) & ((DB_t_CurrentFormUsage="NC") | (DB_GetModuleSettingByNUM(Module_Companies)=3)))  //16
			If (Count parameters:C259>=4)
				If ($4)
					Gen_Alert("No Valid Companies found"; "Try Again")
				Else 
					Gen_Alert("No Companies found"; "Try Again")
				End if 
				Gen_Alert("No Companies found"; "Try Again")
			End if 
			
			// GOTO AREA($1->)
			vCompCode:=""
		End if   //16
		If (((Records in selection:C76([COMPANIES:2])=0) | (xNew=1)) & (OK=1) & (DB_GetModuleSettingByNUM(Module_Companies)#3) & (DB_t_CurrentFormUsage#"NC"))  //17"
			$_t_CompanyCode2:=Uppercase:C13($1->)  //18
			If (Character code:C91(Substring:C12($_t_CompanyCode2; Length:C16($_t_CompanyCode2); 1))=64)
				$_t_CompanyCode2:=Substring:C12($_t_CompanyCode2; 1; Length:C16($_t_CompanyCode2)-1)
			End if   //18
			If (Character code:C91(Substring:C12($_t_CompanyCode2; Length:C16($_t_CompanyCode2); 1))=64)  //19
				$_t_CompanyCode2:=Substring:C12($_t_CompanyCode2; 1; Length:C16($_t_CompanyCode2)-1)
			End if   //19
			$_bo_ReadOnlyState:=Read only state:C362([COMPANIES:2])
			READ WRITE:C146([COMPANIES:2])
			READ WRITE:C146([CONTACTS:1])
			$_l_AddMode:=vAdd
			$_t_AccessType:=SYS_t_AccessType  // Was used to determine different screens-Aug 2006 no longer used
			$_l_CM:=vCM
			SYS_t_AccessType:=<>SYS_t_AccessType
			
			vAdd:=1
			vCM:=1
			If ($_bo_HideWIndow)
				HIDE WINDOW:C436
			End if 
			CREATE RECORD:C68([COMPANIES:2])
			[COMPANIES:2]Company_Code:1:=$_t_CompanyCode2
			DB_SaveRecord(->[COMPANIES:2])
			AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
			Companies_FileI
			Open_Pro_Window("Enter Company"; 0; 2; ->[COMPANIES:2]; WIN_t_CurrentInputForm)
			MODIFY RECORD:C57([COMPANIES:2]; *)
			Close_ProWin(Table name:C256(->[COMPANIES:2])+"_"+WIN_t_CurrentInputForm)
			If ($_bo_HideWIndow)  //NG
				SHOW WINDOW:C435
			End if 
			If (DB_t_CallOnCloseorSave="AS")  //20
				OK:=1
			End if   //21`
			If (OK=0)  //22
				DB_DeletionControl(->[COMPANIES:2])
				
				DELETE RECORD:C58([COMPANIES:2])
				vCompCode:=""
				GOTO OBJECT:C206($1->)
			Else 
				vCompCode:=[COMPANIES:2]Company_Code:1
			End if   //22
			If ($_bo_ReadOnlyState)  //23
				UNLOAD RECORD:C212([COMPANIES:2])
				READ ONLY:C145([COMPANIES:2])
				If (Table:C252($3)#1)  //24
					UNLOAD RECORD:C212([CONTACTS:1])
					READ ONLY:C145([CONTACTS:1])
				End if   //24
			End if   //23
			vCM:=0
			$_l_AddMode:=vAdd
			SYS_t_AccessType:=$_t_AccessType
			vCM:=$_l_CM
			vFromIn:=False:C215
		End if   //17
		
		$1->:=vCompCode
		If ($1->#[COMPANIES:2]Company_Code:1)  //25
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$1->)
		End if   //25
		vCompName:=[COMPANIES:2]Company_Name:2
		vTel:=[COMPANIES:2]Telephone:9
	End if 
	
	DB_t_CallOnCloseorSave:=$_t_CloseSave
Else 
	QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$1->)
	vCompName:=[COMPANIES:2]Company_Name:2
	vTel:=[COMPANIES:2]Telephone:9
End if 
If ([COMPANIES:2]Country:8#"")
	If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
		QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
		COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
	End if 
Else 
	COM_t_TelephoneNumberFormat:=<>SYS_t_DefaultTelFormat
End if 
If (COM_t_TelephoneNumberFormat#"")
	OBJECT SET FORMAT:C236(vTel; COM_t_TelephoneNumberFormat)
End if 
ERR_MethodTrackerReturn("Check_Company"; $_t_oldMethodName)
