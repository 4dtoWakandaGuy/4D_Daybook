//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_HandleBKITMDATA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2012 07:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ITM_abo_Detail_Boolean;0;0)
	//ARRAY BOOLEAN(ITM_abo_Header;0)
	//ARRAY DATE(ITM_ad_Detail_Date;0;0)
	//ARRAY DATE(ITM_ad_Header_Date;0)
	//ARRAY INTEGER(ITM_ai_Detail_Integer;0;0)
	//ARRAY INTEGER(ITM_al_Header_Integer;0)
	//ARRAY LONGINT(DM_al_DataSources;0)
	//ARRAY LONGINT(DM_al_DBFieldNUM;0)
	//ARRAY LONGINT(DM_al_DBTableNUM;0)
	//ARRAY LONGINT(ITM_al_Detail_Fields;0)
	//ARRAY LONGINT(ITM_al_Detail_Longint;0;0)
	//ARRAY LONGINT(ITM_al_Detail_SFieldType;0)
	//ARRAY LONGINT(ITM_al_Header_Fields;0)
	//ARRAY LONGINT(ITM_al_Header_Longint;0)
	//ARRAY LONGINT(ITM_al_Header_SFieldType;0)
	//ARRAY REAL(ITM_ar_Detail_Real;0;0)
	//ARRAY REAL(ITM_ar_Header_Real;0)
	//ARRAY TEXT(DM_at_BKDataFieldNM;0)
	//ARRAY TEXT(DM_at_DataSources;0)
	//ARRAY TEXT(DM_at_FieldData;0)
	//ARRAY TEXT(DM_at_UpdateFields;0)
	//ARRAY TEXT(DM_at_UpdateValues;0)
	//ARRAY TEXT(IITM_at_DetailStrings;0;0)
	//ARRAY TEXT(ITM_at_Detail_Text;0;0)
	//ARRAY TEXT(ITM_at_DetailSField;0)
	//ARRAY TEXT(ITM_at_Header_Text;0)
	//ARRAY TEXT(ITM_at_HeaderSField;0)
	//ARRAY TEXT(ITM_at_HeaderStrings;0)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283($_l_AddedItemID; $_l_ArraySize; $_l_CharacterPosition; $_l_CountDetails; $_l_Error; $_l_FieldIndex; $_l_FieldPosition; $_l_Index; $_l_LastRecord; $_l_ListID; $_l_Row)
	C_LONGINT:C283($_l_SourceID; $_l_SourcePosition; $_l_TablePosition; DM_l_BKOptions; DM_l_DestinationContext)
	C_POINTER:C301($3; $4)
	C_REAL:C285($1)
	C_TEXT:C284($_t_BKQuery; $_t_oldMethodName; $2; DM_t_ProductCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_HandleBKITMDATA")
ARRAY LONGINT:C221(ITM_al_Header_Fields; 0)
ARRAY TEXT:C222(ITM_at_HeaderSField; 0)
ARRAY LONGINT:C221(ITM_al_Header_SFieldType; 0)
ARRAY TEXT:C222(ITM_at_HeaderStrings; 0)
ARRAY INTEGER:C220(ITM_al_Header_Integer; 0)
ARRAY LONGINT:C221(ITM_al_Header_Longint; 0)
ARRAY REAL:C219(ITM_ar_Header_Real; 0)
ARRAY DATE:C224(ITM_ad_Header_Date; 0)
ARRAY BOOLEAN:C223(ITM_abo_Header; 0)
ARRAY TEXT:C222(ITM_at_Header_Text; 0)
ARRAY LONGINT:C221(ITM_al_Detail_Fields; 0)
ARRAY TEXT:C222(ITM_at_DetailSField; 0)
ARRAY LONGINT:C221(ITM_al_Detail_SFieldType; 0)
ARRAY TEXT:C222(IITM_at_DetailStrings; 0; 0)
ARRAY INTEGER:C220(ITM_ai_Detail_Integer; 0; 0)
ARRAY LONGINT:C221(ITM_al_Detail_Longint; 0; 0)
ARRAY REAL:C219(ITM_ar_Detail_Real; 0; 0)
ARRAY DATE:C224(ITM_ad_Detail_Date; 0; 0)
ARRAY BOOLEAN:C223(ITM_abo_Detail_Boolean; 0; 0)
ARRAY TEXT:C222(ITM_at_Detail_Text; 0; 0)
For ($_l_Index; 1; Size of array:C274(DM_at_BKDataFieldNM))
	$_l_CharacterPosition:=Position:C15("C04"; DM_at_BKDataFieldNM{$_l_Index})
	If ($_l_CharacterPosition>0)
		$_l_TablePosition:=$_l_Index
		$_l_Index:=Size of array:C274(DM_at_BKDataFieldNM)
	End if 
End for 
If ($_l_TablePosition>0)
	//it should be
	//NOTE THAT THIS IS HARD CODED
	DM_al_DBTableNUM{$_l_TablePosition}:=Table:C252(->[PRODUCTS:9])
	DM_al_DBFieldNUM{$_l_TablePosition}:=Field:C253(->[PRODUCTS:9]Product_Code:1)
End if 
$_bo_OK:=False:C215
$_l_CountDetails:=0
$_l_LastRecord:=0
$_l_Row:=$1
If (Size of array:C274(DM_at_FieldData)>=$_l_Row)
	Repeat 
		IDLE:C311
		$_l_CountDetails:=$_l_CountDetails+1
		For ($_l_FieldIndex; 1; Size of array:C274(DM_at_FieldData{$_l_Row}))
			Case of 
				: (DM_al_DBTableNUM{$_l_FieldIndex}=Table:C252(->[PRODUCTS:9]))  //header
					If (DM_al_DBFieldNUM{$_l_FieldIndex}>0)
						$_l_FieldPosition:=Find in array:C230(ITM_al_Header_Fields; DM_al_DBFieldNUM{$_l_FieldIndex})
						If ($_l_FieldPosition<0)
							$_l_ArraySize:=Size of array:C274(ITM_al_Header_Fields)+1
							INSERT IN ARRAY:C227(ITM_al_Header_Fields; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(ITM_at_HeaderSField; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(ITM_al_Header_SFieldType; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(ITM_at_HeaderStrings; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(ITM_al_Header_Integer; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(ITM_al_Header_Longint; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(ITM_ar_Header_Real; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(ITM_ad_Header_Date; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(ITM_abo_Header; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(ITM_at_Header_Text; $_l_ArraySize; 1)
							$_l_FieldPosition:=Size of array:C274(ITM_al_Header_Fields)
						End if 
						ITM_al_Header_Fields{$_l_FieldPosition}:=DM_al_DBFieldNUM{$_l_FieldIndex}
						ITM_at_HeaderSField{$_l_FieldPosition}:=DM_at_BKDataFieldNM{$_l_FieldIndex}
						//because we know all the data is in alpha format
						ITM_al_Header_SFieldType{$_l_FieldPosition}:=Is text:K8:3
						ITM_at_Header_Text{$_l_FieldPosition}:=DM_at_FieldData{$_l_Row}{$_l_FieldIndex}
					End if 
					
					
					
					
			End case 
		End for 
		
		$_l_Row:=$_l_Row+1
		
	Until ($_l_Row>$_l_LastRecord)
	//$0:=$_l_Row-1
	// we now have extracted a single complete order
	//  DM_l_DestinationContext:=0
	$_l_Error:=0
Else 
	//TRACE
	$_l_Error:=-1
End if 

If ($_l_Error=0)
	
	ARRAY LONGINT:C221(DM_al_DataSources; 0)
	ARRAY TEXT:C222(DM_at_DataSources; 0)
	$_l_ListID:=AA_LoadListByName("Defined Data Sources"; ->DM_at_DataSources; ->DM_al_DataSources)
	$_l_SourcePosition:=Find in array:C230(DM_at_DataSources; "Business Kit")
	If ($_l_SourcePosition<0)
		$_l_AddedItemID:=AA_ListAddItembyID($_l_ListID; "Business Kit")
		$_l_ListID:=AA_LoadListByName("Defined Data Sources"; ->DM_at_DataSources; ->DM_al_DataSources)
		
	End if 
	$_l_SourceID:=DM_al_DataSources{Find in array:C230(DM_at_DataSources; "Business Kit")}
	DM_t_ProductCode:=""
	$_bo_OK:=DM_Validate($1; DM_l_DestinationContext; $_l_SourceID; DM_l_BKOptions; "Header"; "Detail"; ->DM_t_ProductCode)
	If (Count parameters:C259>=2)
		$3->:=DM_t_ProductCode
		//and if this created or modified a record then update the business kit
		$_t_BKQuery:=$2
		//pack the data into a blob here
		//  BK_UpdateRecord("ITM";$_t_BKQuery;
		ARRAY TEXT:C222(DM_at_UpdateValues; 1)
		ARRAY TEXT:C222(DM_at_UpdateFields; 1)
		DM_at_UpdateValues{1}:=DM_t_ProductCode
		DM_at_UpdateFields{1}:="C04"
		DM_SetBKRecord($1; $2; $3; $4; ->DM_at_UpdateValues; ->DM_at_UpdateFields)
		
		
		
	End if 
	
Else 
	//errors
End if 
ERR_MethodTrackerReturn("DM_HandleBKITMDATA"; $_t_oldMethodName)