//%attributes = {}
If (False:C215)
	//Project Method Name:      BDL_GetVar
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
	ARRAY INTEGER:C220($_ai_BundleTypes; 0)
	ARRAY LONGINT:C221($_al_BundleOffsets; 0)
	ARRAY LONGINT:C221($_al_BundleSizes; 0)
	//ARRAY TEXT(BDL_at_BundleName;0)
	C_BOOLEAN:C305(<>BDL_bo_Compress)
	C_LONGINT:C283($_l_BlobSize; $_l_BundleType; $_l_Element; $_l_NameArrOffset; $_l_offset; $_l_OffsetArrOffset; $_l_Parameters; $_l_TypeArrOffset)
	C_POINTER:C301($_ptr_BundleBLOB; $_ptr_Variable; $1; $3)
	C_TEXT:C284(<>GEN_t_ERROR; <>GEN_t_OK; $_t_oldMethodName; $_t_Result; $0; $2; BDL_s_Name; BDL_t_Error)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BDL_GetVar")
//******************************************************************************
//Method: BDL_GetVar

//Purpose:  Gets a variable from a BLOb bundle - if
//it doesn't exist, it sets BDL_t_Error
//
//$1 - pointer to a BLOb bundle
//$2 - string 79, name of variable
//$3 - pointer to a variable to store result in
//Sets BDL_t_Error in the event of an error
//
//IWS_t_CurrentMethodName:="BDL_GetVar"
//
//******************************************************************************

$_t_Result:=<>GEN_t_ERROR
$_l_Parameters:=Count parameters:C259

If ($_l_Parameters>1)
	
	$_ptr_BundleBLOB:=$1
	BDL_s_Name:=$2
	BDL_t_Error:=""
	
	If ($_l_Parameters=3)
		$_ptr_Variable:=$3
	Else 
		$_ptr_Variable:=Get pointer:C304(BDL_s_Name)
	End if 
	//changed by John, 4/27/99, so this test applies even where
	//a pointer is passed in $3
	If (Is nil pointer:C315($_ptr_Variable))
		BDL_t_Error:="No such variable!"
	End if 
	
	If (BDL_t_Error="")
		ARRAY TEXT:C222(BDL_at_BundleName; 0)  //needs to be process var so we can use binary search
		ARRAY INTEGER:C220($_ai_BundleTypes; 0)
		ARRAY LONGINT:C221($_al_BundleOffsets; 0)
		ARRAY LONGINT:C221($_al_BundleSizes; 0)
		
		If (<>BDL_bo_Compress)
			EXPAND BLOB:C535($_ptr_BundleBLOB->)
		End if 
		
		Case of 
			: (BLOB size:C605($_ptr_BundleBLOB->)<<>BDL_l_MINBDLSIZE)  //minimum size of an initialised Blob bundle
				BDL_t_Error:="Not a valid BLOb bundle"
			: ($_ptr_BundleBLOB->{0}#Character code:C91("B")) | ($_ptr_BundleBLOB->{1}#Character code:C91("D")) | ($_ptr_BundleBLOB->{2}#Character code:C91("L"))
				BDL_t_Error:="Not a valid BLOb bundle"
			Else 
				$_l_BlobSize:=BLOB size:C605($_ptr_BundleBLOB->)
				//First get name infomation...
				
				$_l_offset:=$_l_BlobSize-16
				$_l_NameArrOffset:=BLOB to longint:C551($_ptr_BundleBLOB->; 0; $_l_offset)
				BLOB TO VARIABLE:C533($_ptr_BundleBLOB->; BDL_at_BundleName; $_l_NameArrOffset)
				
				//Now get type information...
				$_l_offset:=$_l_BlobSize-12
				$_l_TypeArrOffset:=BLOB to longint:C551($_ptr_BundleBLOB->; 0; $_l_offset)
				BLOB TO VARIABLE:C533($_ptr_BundleBLOB->; $_ai_BundleTypes; $_l_TypeArrOffset)
				
				//Now get offset information...
				$_l_offset:=$_l_BlobSize-8
				$_l_OffsetArrOffset:=BLOB to longint:C551($_ptr_BundleBLOB->; 0; $_l_offset)
				BLOB TO VARIABLE:C533($_ptr_BundleBLOB->; $_al_BundleOffsets; $_l_OffsetArrOffset)
				
				
				
				$_l_Element:=UTI_ArraySearch(->BDL_at_BundleName; ->BDL_s_Name)
				If ($_l_Element>0)  //the element already existed
					//  Remove number of bytes indicated at the offset
					$_l_offset:=$_al_BundleOffsets{$_l_Element}
					$_l_BundleType:=$_ai_BundleTypes{$_l_Element}
					If (Type:C295($_ptr_Variable->)=$_l_BundleType)
						BLOB TO VARIABLE:C533($_ptr_BundleBLOB->; $_ptr_Variable->; $_l_offset)
					Else 
						BDL_t_Error:="Type mismatch"
					End if 
				Else 
					BDL_t_Error:="No such element"
				End if 
				
		End case 
		
		If (<>BDL_bo_Compress)
			COMPRESS BLOB:C534($_ptr_BundleBLOB->)
		End if 
	End if 
	
	If (BDL_t_Error#"")
		// ALERT(BDL_t_Error)`remove ALERT S. Frey 12/8/98
		$_t_Result:=<>GEN_t_ERROR+Char:C90(Tab:K15:37)+BDL_t_Error
	Else 
		$_t_Result:=<>GEN_t_OK
	End if 
	
Else   //bad # of parameters
	
	$_t_Result:=$_t_Result+Char:C90(Tab:K15:37)+"Bad # of Parameters"
	
End if 

$0:=$_t_Result
//end

//LOG_ResetMethod
ERR_MethodTrackerReturn("BDL_GetVar"; $_t_oldMethodName)
