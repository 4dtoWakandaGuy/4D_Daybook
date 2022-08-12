//%attributes = {}
If (False:C215)
	//Project Method Name:      LR_Main_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/10/2012 14:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($RememberLR_bo_Enable; DB_bo_NoLoad; LR_bo_Enable)
	C_DATE:C307($_d_Date)
	C_LONGINT:C283($RememberLR_l_LicencePortNumber; LR_bAcceptMain; LR_bCancelMain; LR_bGetUpdate; LR_bImportLicence; LR_l_EnableCHK; LR_l_CalledFromProcess; LR_l_LicencePortNumber)
	C_POINTER:C301(LIC_ptr_LicenceTable; LR_ptr_LicenceDateAdded; LR_ptr_LicenceFile; LR_ptr_LicenceTimeAdded)
	C_TEXT:C284($_t_oldMethodName; $RememberLR_t_LicenceHost; $RememberLR_T_WebserviceName; LR_t_LicenceHost; LR_T_WebserviceName; vErrorMessage)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LR_Main_In")



Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		//`
		//START TRANSACTION `NG-no need to do this in a transaction as only update the record if saved
		//Load the variables
		LR_Custom
		If (LR_bo_Enable)
			LR_l_EnableCHK:=1
		Else 
			LR_l_EnableCHK:=0
		End if 
		//
	: (Form event code:C388=On Clicked:K2:4)
		Case of 
			: (LR_bCancelMain=1)
				LR_bCancelMain:=0
				If (LR_l_CalledFromProcess>0)
					POST OUTSIDE CALL:C329(LR_l_CalledFromProcess)
				End if 
				//CANCEL TRANSACTION `no longer needed either - 10/01/08 -kmw
				CANCEL:C270
				
			: (LR_bAcceptMain=1)
				LR_bAcceptMain:=0
				
				$RememberLR_t_LicenceHost:=LR_t_LicenceHost
				$RememberLR_T_WebserviceName:=LR_T_WebserviceName
				$RememberLR_l_LicencePortNumber:=LR_l_LicencePortNumber
				$RememberLR_bo_Enable:=LR_bo_Enable
				LR_Custom  //we are only calling LR_Custom so we can get the various field pointers... unfortunately it has effect of reloading our parameters that have very likely just been changed by the user (hence why we remember above and change back below)
				LR_t_LicenceHost:=$RememberLR_t_LicenceHost
				LR_T_WebserviceName:=$RememberLR_T_WebserviceName
				LR_l_LicencePortNumber:=$RememberLR_l_LicencePortNumber
				LR_bo_Enable:=$RememberLR_bo_Enable
				
				ALL RECORDS:C47(LIC_ptr_LicenceTable->)
				ORDER BY:C49(LIC_ptr_LicenceTable->; LR_ptr_LicenceDateAdded->; <)
				$_d_Date:=LR_ptr_LicenceDateAdded->
				QUERY:C277(LIC_ptr_LicenceTable->; LR_ptr_LicenceDateAdded->=$_d_Date)
				ORDER BY:C49(LIC_ptr_LicenceTable->; LR_ptr_LicenceTimeAdded->; <)
				
				If (LR_l_EnableCHK=0) | (BLOB size:C605(LR_ptr_LicenceFile->)>0)
					If (LR_l_CalledFromProcess>0)
						POST OUTSIDE CALL:C329(LR_l_CalledFromProcess)
					End if 
					//Here save the values to the preference
					LR_Custom(True:C214)  // to save the values
					//VALIDATE TRANSACTION
					CANCEL:C270
				Else   //if they have checked the "Enable New License Type" box but not yet imported a license file or done an auto license update
					ALERT:C41("Sorry. if you enable the new license type you must also initiate an auto license "+"update or import one manually.")
				End if 
				
			: (LR_bImportLicence=1)
				LR_bImportLicence:=0
				LR_LicenceFileImportEFile
				
				ALERT:C41("You will need to log out and log back into Daybook for the changes to take effect")
				
			: (LR_bGetUpdate=1)
				LR_bGetUpdate:=0
				LR_Custom(True:C214)  // to save the values (have to do this before in case the user has change any of them because we will be using them in the call and they will expect it uses whatever they have changed it to).
				
				vErrorMessage:=""
				Licence_AutoUpdateCheck((Current date:C33(*)-60); False:C215)  //do an auto upate, pass an old date to ensure that it runs the update
				Case of 
					: (vErrorMessage#"")
						ALERT:C41(vErrorMessage)  //we passed false as 2nd param to  Licence_AutoUpdateCheck so we know the error message hasn't displayed yet
					Else 
						ALERT:C41("Licence updated. You will need to log out and log back into Daybook for the chang"+"es to take effect.")
				End case 
				
		End case 
		//
		//
	: (Form event code:C388=On Validate:K2:3)
		//
	Else 
		//
End case 
//
ERR_MethodTrackerReturn("LR_Main_In"; $_t_oldMethodName)
