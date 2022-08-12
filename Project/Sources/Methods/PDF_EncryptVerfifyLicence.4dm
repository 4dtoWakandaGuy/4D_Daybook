//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF_EncryptVerfifyLicence
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2011 16:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_PrivateKey; PDF_Bl_NameInBlob; PDF_blb_PublicKey)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_ModuleSTR; $_t_Name; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF_EncryptVerfifyLicence")

$0:=False:C215
If (BLOB size:C605(PDF_Bl_NameInBlob)#0) & (BLOB size:C605(PDF_blb_PublicKey)#0)
	DECRYPT BLOB:C690(PDF_Bl_NameInBlob; PDF_blb_PublicKey)
	$_t_Name:=BLOB to text:C555(PDF_Bl_NameInBlob; 3)
	$_t_ModuleSTR:=""
	
	For ($_l_Index; Length:C16($_t_Name); 1; -1)
		If ($_t_Name[[$_l_Index]]=";")
			$_t_ModuleSTR:=Substring:C12($_t_Name; $_l_Index+1; Length:C16($_t_Name))
			$_t_Name:=Substring:C12($_t_Name; 1; $_l_Index-1)
			$_l_Index:=0
		End if 
		
	End for 
	If ($_t_ModuleSTR="02")
		ALL RECORDS:C47([USER:15])
		If ([USER:15]Organisation:1=$_t_Name)
			//Product is licenced
			$0:=True:C214
			GENERATE ENCRYPTION KEYPAIR:C688($_blb_PrivateKey; PDF_blb_PublicKey)
			ENCRYPT BLOB:C689(PDF_Bl_NameInBlob; $_blb_PrivateKey)
			
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("PDF_EncryptVerfifyLicence"; $_t_oldMethodName)
