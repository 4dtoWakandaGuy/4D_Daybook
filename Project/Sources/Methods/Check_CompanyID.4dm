//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_CompanyID
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/11/2010 12:47
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Address_Status)
	C_BOOLEAN:C305(<>MultiCo; $_bo_ReadOnlyState; vAutoFind; vFromIn)
	C_LONGINT:C283($_l_AddMode; $0; vAdd; vCM; xNew)
	C_POINTER:C301($1; $2; $3)
	C_TEXT:C284(<>SYS_t_AccessType; <>SYS_t_DefaultTelFormat; $_t_AccessType; $_t_CloseSave; $_t_CompanyCode; $_t_CompanyName; $_t_CurrentFormUsage2; $_t_oldMethodName; $_t_ParentCompany; $_t_SearchCompanyCode; COM_t_TelephoneNumberFormat)
	C_TEXT:C284(DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; SYS_t_AccessType; VCompCode; vCompName; vContCode; vLayCode; vTel; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_CompanyID")
//this method is similar to Check_Company
//however it will return in $0 the[COMPANIES]x_ID

//Check_Company

If ($1->#"")
	$1->:=Check_QM($1->)
	$_t_CloseSave:=DB_t_CallOnCloseorSave
	xNew:=0
	QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$1->)
	
	If ((Records in selection:C76([COMPANIES:2])=1) & ([COMPANIES:2]Company_Code:1=$1->) & (Character code:C91(Substring:C12($1->; Length:C16($1->); 1))#64))
		$0:=[COMPANIES:2]x_ID:63
	Else 
		If ($2->>0) & (<>MultiCo)  //& (Table($2)#1))
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=$2->)
			$_t_SearchCompanyCode:=Sel_AtSign($1->)
			QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
			QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
			
			QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$_t_SearchCompanyCode)
			
			If (Records in selection:C76([CONTACTS_COMPANIES:145])>0)
				Check_MultiCo(->[CONTACTS:1]Contact_Code:2; $1; $3)
			Else 
				vAutoFind:=False:C215
				If (Table:C252($3)=1)
					Comp_Sel2($1->; "1")
				Else 
					vLayCode:=$1->
					//Loaded in to allow Check_ContDef to put in the right Cont if srch here by Cont
					Comp_Sel2($1->)
				End if 
			End if 
		Else 
			vAutoFind:=False:C215
			If (Table:C252($3)=1)
				Comp_Sel2($1->; "1")
			Else 
				vLayCode:=$1->
				//Loaded in to allow Check_ContDef to put in the right Cont if srch here by Cont
				Comp_Sel2($1->)
				
			End if 
		End if 
		
		If (Records in selection:C76([COMPANIES:2])>1)
			
			Check_DispNum(->[COMPANIES:2]; "Companies")
			If (OK=1)
				$_t_CurrentFormUsage2:=DB_t_CurrentFormUsage2
				If (Table:C252($3)=1)
					DB_t_CurrentFormUsage2:="Contact"
				End if 
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=$2->)
				vContCode:=[CONTACTS:1]Contact_Code:2
				Check_Company2
				WS_KeepFocus
				$0:=0
				If (OK=0)
					GOTO OBJECT:C206($1->)
				Else 
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=VCompCode)
					$0:=[COMPANIES:2]x_ID:63
				End if 
				//_O_ENABLE BUTTON(xNew)
				OBJECT SET ENABLED:C1123(xNew; True:C214)
				DB_t_CurrentFormUsage2:=$_t_CurrentFormUsage2
			Else 
				GOTO OBJECT:C206($1->)
			End if 
		Else 
			If (Records in selection:C76([COMPANIES:2])=1)
				$0:=[COMPANIES:2]x_ID:63
				vCompCode:=[COMPANIES:2]Company_Code:1
				
				//Check on Superior
				If (([COMPANIES:2]Superior:34#"") & (DB_t_CurrentFormUsage="IS"))
					$_t_ParentCompany:=[COMPANIES:2]Superior:34
					$_t_CompanyCode:=[COMPANIES:2]Company_Code:1
					COPY NAMED SELECTION:C331([COMPANIES:2]; "Companies")
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_ParentCompany)
					If (Records in selection:C76([COMPANIES:2])=1)
						Gen_Confirm($_t_CompanyCode+" has a 'Superior' as follows:"+Char:C90(13)+[COMPANIES:2]Company_Code:1+"  "+[COMPANIES:2]Company_Name:2+Char:C90(13)+Char:C90(13)+"Which do you want to use?"; "As selected"; "Superior")
						If (OK=1)
							USE NAMED SELECTION:C332("Companies")
						Else 
							vCompCode:=[COMPANIES:2]Company_Code:1
							$0:=[COMPANIES:2]x_ID:63
						End if 
					Else 
						USE NAMED SELECTION:C332("Companies")
					End if 
					CLEAR NAMED SELECTION:C333("Companies")
				End if 
				
			End if 
			If ((Records in selection:C76([COMPANIES:2])=0) & (DB_GetModuleSettingByNUM(Module_Products)#3) & (DB_t_CurrentFormUsage#"NC"))
				Gen_Confirm("That Company does not exist.  Do you want to create it?"; "Try again"; "Create it")
				If (OK=1)
					OK:=0
					vCompCode:=""
					
					GOTO OBJECT:C206($1->)
				Else 
					OK:=1
				End if 
			End if 
		End if 
		If ((Records in selection:C76([COMPANIES:2])=0) & ((DB_t_CurrentFormUsage="NC") | (DB_GetModuleSettingByNUM(Module_Products)=3)))
			Gen_Alert("No Companies found"; "Try Again")
			// GOTO AREA($1->)
			vCompCode:=""
		End if 
		If (((Records in selection:C76([COMPANIES:2])=0) | (xNew=1)) & (OK=1) & (DB_GetModuleSettingByNUM(Module_Products)#3) & (DB_t_CurrentFormUsage#"NC"))
			$_t_CompanyName:=Uppercase:C13($1->)
			If (Character code:C91(Substring:C12($_t_CompanyName; Length:C16($_t_CompanyName); 1))=64)
				$_t_CompanyName:=Substring:C12($_t_CompanyName; 1; Length:C16($_t_CompanyName)-1)
			End if 
			If (Character code:C91(Substring:C12($_t_CompanyName; Length:C16($_t_CompanyName); 1))=64)
				$_t_CompanyName:=Substring:C12($_t_CompanyName; 1; Length:C16($_t_CompanyName)-1)
			End if 
			$_bo_ReadOnlyState:=Read only state:C362([COMPANIES:2])
			READ WRITE:C146([COMPANIES:2])
			READ WRITE:C146([CONTACTS:1])
			$_l_AddMode:=vAdd
			$_t_AccessType:=SYS_t_AccessType  // Was used to determine different screens-Aug 2006 no longer used
			SYS_t_AccessType:=<>SYS_t_AccessType
			vAdd:=1
			vCM:=1
			CREATE RECORD:C68([COMPANIES:2])
			[COMPANIES:2]Company_Code:1:=$_t_CompanyName
			DB_SaveRecord(->[COMPANIES:2])
			AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
			Companies_FileI
			Open_Pro_Window("Enter Company"; 0; 2; ->[COMPANIES:2]; WIN_t_CurrentInputForm)  //NG may 2004 added input form
			MODIFY RECORD:C57([COMPANIES:2]; *)
			Close_ProWin(Table name:C256(->[COMPANIES:2])+"_"+WIN_t_CurrentInputForm)  //NG may 2004 added input form name
			
			If (DB_t_CallOnCloseorSave="AS")
				OK:=1
			End if 
			If (OK=0)
				DB_DeletionControl(->[COMPANIES:2])
				
				DELETE RECORD:C58([COMPANIES:2])
				vCompCode:=""
				GOTO OBJECT:C206($1->)
			Else 
				vCompCode:=[COMPANIES:2]Company_Code:1
			End if 
			If ($_bo_ReadOnlyState)
				UNLOAD RECORD:C212([COMPANIES:2])
				READ ONLY:C145([COMPANIES:2])
				If (Table:C252($3)#1)
					UNLOAD RECORD:C212([CONTACTS:1])
					READ ONLY:C145([CONTACTS:1])
				End if 
			End if 
			vCM:=0
			$_l_AddMode:=vAdd
			SYS_t_AccessType:=$_t_AccessType
			vFromIn:=False:C215
		End if 
		
		//  $1->:=vCompCode
		If (vCompCode#[COMPANIES:2]Company_Code:1)
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=vCompCode)
			$0:=[COMPANIES:2]x_ID:63
		End if 
		vCompName:=[COMPANIES:2]Company_Name:2
		vTel:=[COMPANIES:2]Telephone:9
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
	End if 
	DB_t_CallOnCloseorSave:=$_t_CloseSave
Else 
	QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$1->)
	$0:=[COMPANIES:2]x_ID:63
	vCompName:=[COMPANIES:2]Company_Name:2
	vTel:=[COMPANIES:2]Telephone:9
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
End if 
ERR_MethodTrackerReturn("Check_CompanyID"; $_t_oldMethodName)
