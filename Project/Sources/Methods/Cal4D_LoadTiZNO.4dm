//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_LoadTiZNO
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 15:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Documents; 0)
	//ARRAY TEXT(CAL_at_DAbbr;0)
	//ARRAY TEXT(CAL_at_DST;0)
	//ARRAY TEXT(CAL_at_LTR;0)
	//ARRAY TEXT(CAL_at_Rules;0)
	//ARRAY TEXT(CAL_at_SAbbr;0)
	//ARRAY TEXT(CAL_at_STD;0)
	//ARRAY TEXT(CAL_at_TiZN;0)
	C_BLOB:C604($_blb_Data)
	C_LONGINT:C283($_l_ArraySize; $_l_Index)
	C_TEXT:C284($_t_Buffer; $_t_oldMethodName; $_t_Path)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_LoadTiZNO")


If (True:C214)
	$_t_Path:=Get 4D folder:C485(Current resources folder:K5:16)+"TiZNO.blob"
	If (Test path name:C476($_t_Path)=Is a document:K24:1)
		DOCUMENT TO BLOB:C525($_t_Path; $_blb_Data)
		If (OK=1)
			$_l_ArraySize:=0
			ARRAY TEXT:C222(CAL_at_TiZN; $_l_ArraySize)
			ARRAY TEXT:C222(CAL_at_LTR; $_l_ArraySize)
			ARRAY TEXT:C222(CAL_at_SAbbr; $_l_ArraySize)
			ARRAY TEXT:C222(CAL_at_STD; $_l_ArraySize)
			ARRAY TEXT:C222(CAL_at_DAbbr; $_l_ArraySize)
			ARRAY TEXT:C222(CAL_at_DST; $_l_ArraySize)
			ARRAY TEXT:C222(CAL_at_Rules; $_l_ArraySize)
			
			$_l_Index:=CAL4D_GetVarsFromBlob($_l_ArraySize; ->$_blb_Data; ->CAL_at_TiZN; ->CAL_at_LTR; ->CAL_at_SAbbr; ->CAL_at_STD; ->CAL_at_DAbbr; ->CAL_at_DST; ->CAL_at_Rules)
			
		End if 
	End if 
	
Else 
	$_t_Path:=Get 4D folder:C485(Current resources folder:K5:16)+"TiZNO.txt"
	If (Test path name:C476($_t_Path)=Is a document:K24:1)
		
		$_ti_DocumentRef:=DB_OpenDocument($_t_Path)
		If (OK=1)
			$_l_Index:=Get document size:C479($_ti_DocumentRef)
			RECEIVE PACKET:C104($_ti_DocumentRef; $_t_Buffer; $_l_Index)
			
			//========================    Method Actions    ==================================
			
			$_l_ArraySize:=STR_CountFields($_t_Buffer; "\r")
			
			ARRAY TEXT:C222(CAL_at_TiZN; $_l_ArraySize)
			ARRAY TEXT:C222(CAL_at_LTR; $_l_ArraySize)
			ARRAY TEXT:C222(CAL_at_SAbbr; $_l_ArraySize)
			ARRAY TEXT:C222(CAL_at_STD; $_l_ArraySize)
			ARRAY TEXT:C222(CAL_at_DAbbr; $_l_ArraySize)
			ARRAY TEXT:C222(CAL_at_DST; $_l_ArraySize)
			ARRAY TEXT:C222(CAL_at_Rules; $_l_ArraySize)
			For ($_l_Index; 1; $_l_ArraySize)
				$_t_Path:=CAL4D_STR_Parse($_t_Buffer; $_l_Index; "\r")
				CAL_at_TiZN{$_l_Index}:=CAL4D_STR_Parse($_t_Path; 1; "\t")
				CAL_at_LTR{$_l_Index}:=CAL4D_STR_Parse($_t_Path; 2; "\t")
				CAL_at_SAbbr{$_l_Index}:=CAL4D_STR_Parse($_t_Path; 3; "\t")
				CAL_at_STD{$_l_Index}:=CAL4D_STR_Parse($_t_Path; 4; "\t")
				CAL_at_DAbbr{$_l_Index}:=CAL4D_STR_Parse($_t_Path; 5; "\t")
				CAL_at_DST{$_l_Index}:=CAL4D_STR_Parse($_t_Path; 6; "\t")
				CAL_at_Rules{$_l_Index}:=CAL4D_STR_Parse($_t_Path; 7; "\t")
			End for 
			
			//========================    Clean up and Exit    =================================
			
			CLOSE DOCUMENT:C267($_ti_DocumentRef)
			
			CAL4D_VarstoBlob(->$_blb_Data; ->CAL_at_TiZN; ->CAL_at_LTR; ->CAL_at_SAbbr; ->CAL_at_STD; ->CAL_at_DAbbr; ->CAL_at_DST; ->CAL_at_Rules)
			$_t_Path:=Get 4D folder:C485(Current resources folder:K5:16)+"TiZNO.blob"
			BLOB TO DOCUMENT:C526($_t_Path; $_blb_Data)
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Cal4D_LoadTiZNO"; $_t_oldMethodName)