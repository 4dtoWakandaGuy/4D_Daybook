//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_VerifyLicence
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_NameInBlob; $_blb_PrivateKey; $1; CCM_blb_NameInBlob; CCM_blb_PublicKey)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_ModuleSTR; $_t_Name; $_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("CCM_VerifyLicence")

$0:=False:C215
If (Count parameters:C259>=1)
	$_blb_NameInBlob:=$1
Else 
	$_blb_NameInBlob:=CCM_blb_NameInBlob
End if 
DECRYPT BLOB:C690($_blb_NameInBlob; CCM_blb_PublicKey)
$_t_Name:=BLOB to text:C555($_blb_NameInBlob; 3)
$_t_ModuleSTR:=""

For ($_l_Index; Length:C16($_t_Name); 1; -1)
	If ($_t_Name[[$_l_Index]]=";")
		$_t_ModuleSTR:=Substring:C12($_t_Name; $_l_Index+1; Length:C16($_t_Name))
		$_t_Name:=Substring:C12($_t_Name; 1; $_l_Index-1)
		$_l_Index:=0
	End if 
	
End for 
If ($_t_ModuleSTR="01")
	ALL RECORDS:C47([USER:15])
	If ([USER:15]Name:38=$_t_Name)
		//Product is licenced
		$0:=True:C214
		
		//******************* added  15/01/09 -kmw v631b120h_4 / v631b120m *******************
		//*********************************************************************************************
		GENERATE ENCRYPTION KEYPAIR:C688($_blb_PrivateKey; CCM_blb_PublicKey)
		//******************* added  15/01/09 -kmw v631b120h_4 / v631b120m *******************
		//********************************************************************************************
		//******************* added  15/01/09 -kmw v631b120h_4 / v631b120m *******************
		//*********************************************************************************************
		ENCRYPT BLOB:C689($_blb_NameInBlob; $_blb_PrivateKey)
		//******************* added  15/01/09 -kmw v631b120h_4 / v631b120m *******************
		//********************************************************************************************
	End if 
	
End if 
ERR_MethodTrackerReturn("CCM_VerifyLicence"; $_t_oldMethodName)
