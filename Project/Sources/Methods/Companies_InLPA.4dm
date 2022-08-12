//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_InLPA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/11/2009 10:34`Method: Companies_InLPA
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	C_BOOLEAN:C305(<>OneEntry; $_bo_Hide; CO_bo_FurtherFieldsLoaded; Co_bo_FurthersSetup; COM_bo_AddingFurther)
	C_LONGINT:C283(<>AutoProc; $_l_Press; $_l_ProcessState; $_l_TableNumber; $1; CO_l_FurtherFieldsMod; CON_l_IPcall; CON_l_SubInfoProcess; vCP; vCT)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_oldMethodName; $_t_SemaphoreName; $_t_TableNumAsString; SYS_t_AccessType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_InLPA")
//First we must exit the current cell
$_bo_Hide:=False:C215
Co_bo_FurthersSetup:=False:C215
If (COM_bo_AddingFurther)
	DB_SaveRecord(->[COMPANIES_RECORD_ANALYSIS:146])
End if 
COM_bo_AddingFurther:=False:C215
//AL_ExitCell (eALContI) `NG 27/7/06 No need for this with list box as the execution cycle is not in a call back
If ([CONTACTS:1]Forename:4#"") | ([CONTACTS:1]Surname:5#"") | ((Modified record:C314([CONTACTS:1])) & ([CONTACTS:1]Contact_Code:2#""))
	
	
	
	
	
	DB_SaveRecord(->[CONTACTS_COMPANIES:145])
	DB_SaveRecord(->[CONTACTS:1])
	
	AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
End if 

If (OK=1)
	If (DB_GetModuleSettingByNUM(14)>1)
		DB_SaveRecord(->[INFORMATION:55])
		AA_CheckFileUnlocked(->[INFORMATION:55]QualityRecordID:16)
	End if 
	DB_SaveRecord(->[COMPANIES:2])
	AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
	
	If (Count parameters:C259>0)
		$_l_Press:=$1
	Else 
		$_l_Press:=0
	End if 
	
	If ($_l_Press#DB_GetButtonFunction("OK"))
		CO_AddressManager(9998; Table:C252(->[COMPANIES:2]); [COMPANIES:2]x_ID:63)
		COM_CommentstoCOM
	End if 
	
	If (CO_bo_FurtherFieldsLoaded)  // Further fields exist for the companies table and are loaded
		If (CO_l_FurtherFieldsMod>0)
			UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
			READ WRITE:C146([CUSTOM_FIELDS:98])
			If (Records in set:C195("COM_FFSelection")>0)
				USE SET:C118("COM_FFSelection")
				DELETE SELECTION:C66([CUSTOM_FIELDS:98])
			End if 
			CLEAR SET:C117("COM_FFSelection")
			FUR_UpdateFurtherFields(->[COMPANIES:2])
			
			
			UNLOAD RECORD:C212([CUSTOM_FIELDS:98])
			READ ONLY:C145([CUSTOM_FIELDS:98])
			//at least one further field has been modified
			
			
		End if 
		$_l_TableNumber:=Table:C252(->[COMPANIES:2])
		$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
		$_t_TableNumAsString:=STR_LeadZeros(String:C10($_l_TableNumber); 3)
		$_t_SemaphoreName:="ALFF"+$_t_TableNumAsString+String:C10(Record number:C243(Table:C252($_l_TableNumber)->))
		CLEAR SEMAPHORE:C144($_t_SemaphoreName)
		CLEAR SET:C117("COM_FFSelection")
		
	End if 
	
	If (OK=1)
		If (SYS_t_AccessType#"Q") | (True:C214)  // Was used to determine different screens-Aug 2006 no longer used
			Comp_CheckCont
			If (DB_GetModuleSettingByNUM(1)#5)  //these buttons aren't on the Silver screen
				Comp_NextCall
				Comp_Letter
			End if 
		End if 
		vCP:=0
		vCT:=0
		If (<>AutoProc>0)
			Gen_AutoProc
		End if 
		Companies_SaveDocOptions  //Added 01/12/08 v631b120i -kmw
		Reports_PrefsCommit  //Added 01/12/08 v631b120i -kmw
	End if 
End if 
If (False:C215)  //dont this is required after reworking in 2010
	If (Not:C34(<>OneEntry))
		HIDE PROCESS:C324(Current process:C322)
		//we are in batch entry-to speed this up we start another window for the next record
		//ZCompanies_In  NG September 2010-new system dont need this
		$_bo_Hide:=True:C214
		
	End if 
End if 

If (CON_l_SubInfoProcess>0)  //This is so if it is a Company_Now it will close
	$_l_ProcessState:=Process state:C330(CON_l_SubInfoProcess)
	If ($_l_ProcessState>=0)
		SET PROCESS VARIABLE:C370(CON_l_SubInfoProcess; CON_l_IPcall; 300)
		POST OUTSIDE CALL:C329(CON_l_SubInfoProcess)
	End if 
End if 
ERR_MethodTrackerReturn("Companies_InLPA"; $_t_oldMethodName)