//%attributes = {}
If (False:C215)
	//Project Method Name:      Licence_AutoUpdateCheck
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2012 15:13
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(LIC_at_ModAttrbNames;0)
	//ARRAY TEXT(LIC_at_ModAttrbValues;0)
	//ARRAY TEXT(LIC_at_NonsModAttrbNames;0)
	//ARRAY TEXT(LIC_at_NonsModAttrbvalues;0)
	//ARRAY TEXT(LIC_at_NonStdAttrbNames;0)
	//ARRAY TEXT(LIC_at_NonStdAttrbValues;0)
	//ARRAY TEXT(LIC_at_StdAttrbNames;0)
	//ARRAY TEXT(LIC_at_StdAttrbValues;0)
	C_BLOB:C604(LIC_blb_eLicenceFile)
	C_BOOLEAN:C305($_bo_Ask; $_bo_ReadOnlyState; $2)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_ExpiryDate; $1)
	C_LONGINT:C283($_l_BlobSize; $_l_Compressed; $_l_CurrentSize; $_l_EndPostion1; $_l_EndPostion2; $_l_EndPostion3; $_l_ExpandedSize; $_l_ExpiryDateRow; $_l_LicenceRow; xOK)
	C_POINTER:C301(LIC_ptr_LicenceTable; LR_ptr_LicenceCode; LR_ptr_LicenceDateAdded; LR_ptr_LicenceFile; LR_ptr_LicenceID; LR_ptr_LicenceModifiedBy; LR_ptr_LicenceOwnerName; LR_ptr_LicenceTimeAdded)
	C_TEXT:C284(<>PathName; <>SYS_t_VersionNumber; $_t_oldMethodName; $_t_ParseVersionNumber; $_t_VersionPart1; $_t_VersionPart2; $_t_VersionPart3; $_t_VersionPart4; LR_t_LicenceHost; LR_t_User; vErrorMessage)
	C_TEXT:C284(vTitle3; vTitle4)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Licence_AutoUpdateCheck")

LR_Custom

vErrorMessage:=""

If (LR_t_LicenceHost#"")
	If (Count parameters:C259>=1)
		If (Count parameters:C259>=2)
			$_bo_Ask:=$2
		Else 
			$_bo_Ask:=True:C214
		End if 
		Case of 
			: ((<>PathName="") | (Current date:C33(*)>$1))
				If ($_bo_Ask)
					Gen_Confirm("Your licence is expired or otherwise invalid. Do you want to attempt to automatic"+"ally upd"+"ate it via"+" a web request to Daybook Ltd?"; "OK"; "Cancel")
					OK:=1
				End if 
			: ((Current date:C33(*)+30)>$1)  //added kmw
				If ($_bo_Ask)
					Gen_Confirm("Your licence will expire on "+String:C10([USER:15]Limit Date:58)+". Do you want to attempt to automatically update it via"+" a web request to Daybook Ltd?"; "OK"; "Cancel")
				Else 
					OK:=1
				End if 
		End case 
		
	Else 
		Case of 
			: ((<>PathName="") | (<>DB_d_CurrentDate>[USER:15]Limit Date:58))
				Gen_Confirm("Your licence is expired or otherwise invalid. Do you want to attempt to automatic"+"ally upd"+"ate it via"+" a web request to Daybook Ltd?"; "OK"; "Cancel")
				
			: ((<>DB_d_CurrentDate+30)>[USER:15]Limit Date:58)  //added kmw
				Gen_Confirm("Your licence will expire on "+String:C10([USER:15]Limit Date:58)+". Do you want to attempt to automatically update it via"+" a web request to Daybook Ltd?"; "OK"; "Cancel")
				
		End case 
	End if 
	
	
	
	If (OK=1)
		//********************************************** added/altered 10/01/07 -kmw **********************************************
		$_t_ParseVersionNumber:=<>SYS_t_VersionNumber
		//
		$_l_EndPostion1:=Position:C15("."; $_t_ParseVersionNumber)
		$_t_VersionPart1:=Substring:C12($_t_ParseVersionNumber; 1; ($_l_EndPostion1-1))
		$_t_ParseVersionNumber:=Substring:C12($_t_ParseVersionNumber; ($_l_EndPostion1+1))
		//
		$_l_EndPostion2:=Position:C15("."; $_t_ParseVersionNumber)
		$_t_VersionPart2:=Substring:C12($_t_ParseVersionNumber; 1; ($_l_EndPostion2-1))
		$_t_ParseVersionNumber:=Substring:C12($_t_ParseVersionNumber; ($_l_EndPostion2+1))
		//
		$_l_EndPostion3:=Position:C15("."; $_t_ParseVersionNumber)
		$_t_VersionPart3:=Substring:C12($_t_ParseVersionNumber; 1; ($_l_EndPostion3-1))
		$_t_ParseVersionNumber:=Substring:C12($_t_ParseVersionNumber; ($_l_EndPostion3+1))
		//
		$_t_VersionPart4:=$_t_ParseVersionNumber
		//
		LIC_blb_eLicenceFile:=LN_WS_RequestNewLicence("DAYBOOK"; DB_GetOrganisation; $_t_VersionPart1; $_t_VersionPart2; $_t_VersionPart3; $_t_VersionPart4)  //project code, client code, 4 parts of the version number
		
		
		//******************************************************************************************************************
		//
		//
		$_l_Compressed:=0
		$_l_ExpandedSize:=0
		$_l_CurrentSize:=0
		//
		BLOB PROPERTIES:C536(LIC_blb_eLicenceFile; $_l_Compressed; $_l_ExpandedSize; $_l_CurrentSize)
		//
		If ($_l_CurrentSize>0) | ($_l_ExpandedSize>0)
			
			//**********moved build arrays to here and do it directly on the returned blob rather than waiting until blob saved to record (want to check for vErrorMessage before we even create a license record) ********
			//********************** altered to use new Eblob type (array vars placed in blob directly as opposed to parsing text) ***********
			ARRAY TEXT:C222(LIC_at_NonStdAttrbNames; 0)
			ARRAY TEXT:C222(LIC_at_NonStdAttrbValues; 0)
			ARRAY TEXT:C222(LIC_at_StdAttrbNames; 0)
			ARRAY TEXT:C222(LIC_at_StdAttrbValues; 0)
			ARRAY TEXT:C222(LIC_at_ModAttrbNames; 0)
			ARRAY TEXT:C222(LIC_at_ModAttrbValues; 0)
			//ARRAY TEXT(LIC_at_NonsModAttrbNames;0)
			//ARRAY TEXT(LIC_at_NonsModAttrbvalues;0)
			ARRAY TEXT:C222(LIC_at_NonsModAttrbNames; 0)
			ARRAY TEXT:C222(LIC_at_NonsModAttrbvalues; 0)
			LR_LicenceFileEBLOBToArrays(->LIC_blb_eLicenceFile; ->LIC_at_StdAttrbNames; ->LIC_at_StdAttrbValues; ->LIC_at_NonStdAttrbNames; ->LIC_at_NonStdAttrbValues; ->LIC_at_ModAttrbNames; ->LIC_at_ModAttrbValues; ->LIC_at_NonsModAttrbNames; ->LIC_at_NonsModAttrbvalues)
			//LR_LicNonStdAttrbNameValPairs (LR_ptr_LicenceFile;->LIC_at_NonStdAttrbNames;->LIC_at_NonStdAttrbValues)
			//LR_LicStdAttrbNameValPairs (LR_ptr_LicenceFile;->LIC_at_StdAttrbNames;->LIC_at_StdAttrbValues)
			//LR_ModStdAttrbNameValPairs (LR_ptr_LicenceFile;->LIC_at_ModAttrbNames;->LIC_at_ModAttrbValues)
			//LR_ModNonStdAttrbNameValPairs (LR_ptr_LicenceFile;->LIC_at_NonsModAttrbNames;->LIC_at_NonsModAttrbvalues)
			//*********************************************************************************************
			//********************************************************************************************************************************************
			If (vErrorMessage="")
				
				READ WRITE:C146(LIC_ptr_LicenceTable->)
				CREATE RECORD:C68(LIC_ptr_LicenceTable->)
				LR_ptr_LicenceID->:=AA_GetNextID(LR_ptr_LicenceID)
				LR_ptr_LicenceCode->:=String:C10(Gen_Code((Table:C252(LIC_ptr_LicenceTable))+255; LR_ptr_LicenceCode))
				LR_ptr_LicenceOwnerName->:=String:C10(LR_ptr_LicenceID->)
				LR_ptr_LicenceDateAdded->:=Current date:C33(*)
				LR_ptr_LicenceTimeAdded->:=Current time:C178(*)
				LR_ptr_LicenceModifiedBy->:=LR_t_User
				//[LR_licence]DateModified:=!00/00/00!
				//[LR_licence]TimeModified:=†00:00:00†
				//[LR_licence]ModifiedBy:=""
				$_l_BlobSize:=BLOB size:C605(LIC_blb_eLicenceFile)
				
				COPY BLOB:C558(LIC_blb_eLicenceFile; LR_ptr_LicenceFile->; 0; 0; $_l_BlobSize)
				
				
				SAVE RECORD:C53(LIC_ptr_LicenceTable->)
				UNLOAD RECORD:C212(LIC_ptr_LicenceTable->)
				READ ONLY:C145(LIC_ptr_LicenceTable->)
				//
				ALL RECORDS:C47(LIC_ptr_LicenceTable->)
				ORDER BY:C49(LIC_ptr_LicenceTable->; LR_ptr_LicenceID->; <)
				FIRST RECORD:C50(LIC_ptr_LicenceTable->)
				//
				If (False:C215)
					//********************** altered to use new Eblob type (array vars placed in blob directly as opposed to parsing text) ***********
					ARRAY TEXT:C222(LIC_at_NonStdAttrbNames; 0)
					ARRAY TEXT:C222(LIC_at_NonStdAttrbValues; 0)
					ARRAY TEXT:C222(LIC_at_StdAttrbNames; 0)
					ARRAY TEXT:C222(LIC_at_StdAttrbValues; 0)
					ARRAY TEXT:C222(LIC_at_ModAttrbNames; 0)
					ARRAY TEXT:C222(LIC_at_ModAttrbValues; 0)
					//ARRAY TEXT(LIC_at_NonsModAttrbNames;0)
					//ARRAY TEXT(LIC_at_NonsModAttrbvalues;0)
					ARRAY TEXT:C222(LIC_at_NonsModAttrbNames; 0)
					ARRAY TEXT:C222(LIC_at_NonsModAttrbvalues; 0)
					LR_LicenceFileEBLOBToArrays(LR_ptr_LicenceFile; ->LIC_at_StdAttrbNames; ->LIC_at_StdAttrbValues; ->LIC_at_NonStdAttrbNames; ->LIC_at_NonStdAttrbValues; ->LIC_at_ModAttrbNames; ->LIC_at_ModAttrbValues; ->LIC_at_NonsModAttrbNames; ->LIC_at_NonsModAttrbvalues)
					//LR_LicNonStdAttrbNameValPairs (LR_ptr_LicenceFile;->LIC_at_NonStdAttrbNames;->LIC_at_NonStdAttrbValues)
					//LR_LicStdAttrbNameValPairs (LR_ptr_LicenceFile;->LIC_at_StdAttrbNames;->LIC_at_StdAttrbValues)
					//LR_ModStdAttrbNameValPairs (LR_ptr_LicenceFile;->LIC_at_ModAttrbNames;->LIC_at_ModAttrbValues)
					//LR_ModNonStdAttrbNameValPairs (LR_ptr_LicenceFile;->LIC_at_NonsModAttrbNames;->LIC_at_NonsModAttrbvalues)
					//*********************************************************************************************
				End if 
				$_l_LicenceRow:=Find in array:C230(LIC_at_NonStdAttrbNames; "LICENSENUMBER")
				If ($_l_LicenceRow<0)
					$_l_LicenceRow:=Find in array:C230(LIC_at_NonStdAttrbNames; "LICENCENUMBER")
				End if 
				Case of 
					: ($_l_LicenceRow<1)
						ALERT:C41("Sorry. The licence nu"+"mber couldn't be determined from the licence file. Please report this problem. In"+" t"+"he mean time, try asking for the licence number and typing it in manually.")
						<>PathName:=""
					: (LIC_at_NonStdAttrbValues{$_l_LicenceRow}="")
						ALERT:C41("Sorry. The licence nu"+"mber couldn't be determined from the licence file. Please report this problem. In"+" t"+"he mean time, try asking "+" for the licence"+" number and typing it in manually.")
						<>PathName:=""
					Else 
						<>PathName:=LIC_at_NonStdAttrbValues{$_l_LicenceRow}  //licence Number
				End case 
				
				//
				$_l_ExpiryDateRow:=Find in array:C230(LIC_at_StdAttrbNames; "LICENSE EXPIRY DATE")
				If ($_l_ExpiryDateRow<0)
					$_l_ExpiryDateRow:=Find in array:C230(LIC_at_StdAttrbNames; "LICENCE EXPIRY DATE")
				End if 
				If ($_l_ExpiryDateRow>0)
					$_d_ExpiryDate:=Date:C102(LIC_at_StdAttrbValues{$_l_ExpiryDateRow})
				Else 
					$_d_ExpiryDate:=!00-00-00!
				End if 
				
				//LicNumScreenPathNameEntryCheck
				//
				$_l_LicenceRow:=Find in array:C230(LIC_at_NonStdAttrbNames; "VALIDATION3")
				Case of 
					: ($_l_LicenceRow<1)
						$_l_LicenceRow:=Find in array:C230(LIC_at_NonStdAttrbNames; "VALIDCODE")
						Case of 
							: ($_l_LicenceRow<1)
								ALERT:C41("Sorry. The validation Code couldn't be determined from the licence file. Please r"+"eport this problem. In"+" t"+"he mean time, try asking for the validation code and typing it in manually.")
								vTitle3:=""
							: (LIC_at_NonStdAttrbValues{$_l_LicenceRow}="")
								ALERT:C41("Sorry. The validation Code couldn't be determined from the licence file. Please r"+"eport this problem. In"+" t"+"he mean time, try asking for the validation code and typing it in manually.")
								vTitle3:=""
							Else 
								vTitle3:=LIC_at_NonStdAttrbValues{$_l_LicenceRow}  //Validation Code
						End case 
					: (LIC_at_NonStdAttrbValues{$_l_LicenceRow}="")
						$_l_LicenceRow:=Find in array:C230(LIC_at_NonStdAttrbNames; "VALIDCODE")
						Case of 
							: ($_l_LicenceRow<1)
								ALERT:C41("Sorry. The validation Code couldn't be determined from the licence file. Please r"+"eport this problem. In"+" t"+"he mean time, try asking for the validation code and typing it in manually.")
								vTitle3:=""
							: (LIC_at_NonStdAttrbValues{$_l_LicenceRow}="")
								ALERT:C41("Sorry. The validation Code couldn't be determined from the licence file. Please r"+"eport this problem. In"+" t"+"he mean time, try asking for the validation code and typing it in manually.")
								vTitle3:=""
							Else 
								vTitle3:=LIC_at_NonStdAttrbValues{$_l_LicenceRow}  //Validation Code
						End case 
					Else 
						vTitle3:=LIC_at_NonStdAttrbValues{$_l_LicenceRow}  //Validation Code
				End case 
				If ($_d_ExpiryDate=!00-00-00!)  //
					If (vTitle3#"")
						Date_Test2(vTitle3)
						If (<>DB_d_CurrentDate>[USER:15]Limit Date:58)
							BEEP:C151
							vTitle4:="Not Accepted"
							vTitle3:=""
							GOTO OBJECT:C206(vTitle3)
							OBJECT SET ENABLED:C1123(xOK; False:C215)
							
						Else 
							vTitle4:=String:C10(([USER:15]Limit Date:58-<>DB_d_CurrentDate)+1)+" days remaining"
							vTitle3:=""
							OBJECT SET ENABLED:C1123(xOK; True:C214)
							
							SAVE RECORD:C53([USER:15])  //added kmw 10/10/07
						End if 
					End if 
				Else 
					$_bo_ReadOnlyState:=Read only state:C362([USER:15])
					If ($_bo_ReadOnlyState=True:C214)
						READ WRITE:C146([USER:15])
						LOAD RECORD:C52([USER:15])
						[USER:15]Limit Date:58:=$_d_ExpiryDate
						DB_SaveRecord(->[USER:15])
						If (<>DB_d_CurrentDate>[USER:15]Limit Date:58)
							BEEP:C151
							vErrorMessage:="Sorry. Error with licence. Licence issued is already expired! Please contact Dayb"+"ook"
							vTitle4:="Not Accepted"
							vTitle3:=""
							GOTO OBJECT:C206(vTitle3)
							OBJECT SET ENABLED:C1123(xok; False:C215)
							
							//_O_DISABLE BUTTON(xOK)
						Else 
							vTitle4:=String:C10(([USER:15]Limit Date:58-<>DB_d_CurrentDate)+1)+" days remaining"
							vTitle3:=""
							//_O_ENABLE BUTTON(xOK)
							OBJECT SET ENABLED:C1123(xok; True:C214)
							
							SAVE RECORD:C53([USER:15])  //added kmw 10/10/07
						End if 
						
					End if 
					
				End if 
			Else   //an error message has been passed back from license numbrer
				If ($_bo_Ask)
					ALERT:C41(vErrorMessage)  //vErrorMessage is set by LR_LicenceFileEBLOBToArrays based on if it finds an error message returned by LicenseNumberer
				Else 
					//The licence is now expired
				End if 
			End if 
		Else 
			//Removed the date check 20/08/08 -kmw (all calls to License_AutoUpdateCheck now pass false so up to them to decide fo rany reason not to display an error)
			//If (Current date(*)>=($1-3))
			vErrorMessage:="Sorry. Unable to get an automatic (via the web) licence update from Daybook Ltd. "+"You "+"will need "+"to re-licence manually (using a licence code or licence file - either of"+" which can be obtained from "+" D"+"aybook Ltd) ."
			If ($_bo_Ask)
				ALERT:C41(vErrorMessage)
			Else 
				//The licence is now expired
			End if 
			//End if
		End if 
		//Path_Check (True)`removed 17/01/08 -kmw
	End if   //if OK=1
	
Else 
	vErrorMessage:="Sorry. Unable to do an auto update of licence as the auto update licence host nam"+"e has not been specified."
End if 
ERR_MethodTrackerReturn("Licence_AutoUpdateCheck"; $_t_oldMethodName)
