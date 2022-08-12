//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_HandleBKORDDATA
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
	//ARRAY BOOLEAN(ORD_abo_DetailBoolean;0;0)
	//ARRAY BOOLEAN(ORD_aB_Header_Boolean;0)
	//ARRAY DATE(ORD_ad_Detail_Date;0;0)
	//ARRAY DATE(ORD_ad_Header_Date;0)
	//ARRAY INTEGER(ORD_ai_Detail_Integer;0;0)
	//ARRAY INTEGER(ORD_al_Header_Integer;0)
	//ARRAY LONGINT(DM_al_DataSources;0)
	//ARRAY LONGINT(DM_al_DBFieldNUM;0)
	//ARRAY LONGINT(DM_al_DBTableNUM;0)
	//ARRAY LONGINT(ORD_al_Detail_Fields;0)
	//ARRAY LONGINT(ORD_al_Detail_Longint;0;0)
	//ARRAY LONGINT(ORD_al_Detail_SFieldType;0)
	//ARRAY LONGINT(ORD_al_Header_Fields;0)
	//ARRAY LONGINT(ORD_al_Header_Longint;0)
	//ARRAY LONGINT(ORD_al_Header_SFieldType;0)
	//ARRAY REAL(ORD_ar_Detail_Real;0;0)
	//ARRAY REAL(ORD_ar_Header_Real;0)
	//ARRAY TEXT(DM_at_BKDataFieldNM;0)
	//ARRAY TEXT(DM_at_DataSources;0)
	//ARRAY TEXT(DM_at_FieldData;0)
	//ARRAY TEXT(DM_at_UpdateFields;0)
	//ARRAY TEXT(DM_at_UpdateValues;0)
	//ARRAY TEXT(ORD_at_Detail_Text;0;0)
	//ARRAY TEXT(ORD_at_DetailSField;0)
	//ARRAY TEXT(ORD_at_DetailStrings;0;0)
	//ARRAY TEXT(ORD_at_Header_Text;0)
	//ARRAY TEXT(ORD_at_HeaderSField;0)
	//ARRAY TEXT(ORD_at_HeaderString;0)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283($_l_AddedItemID; $_l_ArraySize; $_l_CountDetails; $_l_DataSourceID; $_l_Error; $_l_FieldsIndex; $_l_FieldsIndex2; $_l_Index; $_l_KeyFieldNum; $_l_LastRecord; $_l_ListID)
	C_LONGINT:C283($_l_lndex; $_l_SlashPosition; $_l_SourcePosition; DM_l_BKOptions; DM_l_BKPostAction; DM_l_DestinationContext)
	C_POINTER:C301($4; $5)
	C_REAL:C285($0; $1; $2)
	C_TEXT:C284($_t_BKQuery; $_t_KeyFieldData; $_t_KeyFieldData2; $_t_KeyFieldData3; $_t_oldMethodName; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_HandleBKORDDATA")
$_bo_OK:=False:C215
$_l_KeyFieldNum:=Find in array:C230(DM_at_BKDataFieldNM; "orderCode")
$_t_KeyFieldData:=DM_at_FieldData{$1}{$_l_KeyFieldNum}
$_l_SlashPosition:=Position:C15("/"; $_t_KeyFieldData)
If ($_l_SlashPosition>0)
	$_t_KeyFieldData:=Substring:C12($_t_KeyFieldData; 1; $_l_SlashPosition-1)
	DM_at_FieldData{$1}{$_l_KeyFieldNum}:=$_t_KeyFieldData
End if 

For ($_l_lndex; $1; Size of array:C274(DM_at_FieldData))
	$_t_KeyFieldData2:=DM_at_FieldData{$_l_lndex}{$_l_KeyFieldNum}
	$_l_SlashPosition:=Position:C15("/"; $_t_KeyFieldData2)
	If ($_l_SlashPosition>0)
		$_t_KeyFieldData2:=Substring:C12($_t_KeyFieldData2; 1; $_l_SlashPosition-1)
		DM_at_FieldData{$_l_lndex}{$_l_KeyFieldNum}:=$_t_KeyFieldData2
	End if 
	If (($_t_KeyFieldData2)=($_t_KeyFieldData))
		$_l_LastRecord:=$_l_lndex
	Else 
		$_l_lndex:=Size of array:C274(DM_at_FieldData)+1
	End if 
End for 

ARRAY LONGINT:C221(ORD_al_Header_Fields; 0)
ARRAY TEXT:C222(ORD_at_HeaderSField; 0)
ARRAY LONGINT:C221(ORD_al_Header_SFieldType; 0)
ARRAY TEXT:C222(ORD_at_HeaderString; 0)
ARRAY INTEGER:C220(ORD_al_Header_Integer; 0)
ARRAY LONGINT:C221(ORD_al_Header_Longint; 0)
ARRAY REAL:C219(ORD_ar_Header_Real; 0)
ARRAY DATE:C224(ORD_ad_Header_Date; 0)
ARRAY BOOLEAN:C223(ORD_aB_Header_Boolean; 0)
ARRAY TEXT:C222(ORD_at_Header_Text; 0)

$_l_SourcePosition:=Find in array:C230(DM_at_BKDataFieldNM; "T01")
If ($_l_SourcePosition>0)
	//it should be mapped
	//NOTE THAT THIS IS HARD CODED
	If (DM_al_DBTableNUM{$_l_SourcePosition}=0)
		DM_al_DBTableNUM{$_l_SourcePosition}:=Table:C252(->[ORDER_ITEMS:25])
		DM_al_DBFieldNUM{$_l_SourcePosition}:=Field:C253(->[ORDER_ITEMS:25]Product_Name:13)
	End if 
End if 


ARRAY LONGINT:C221(ORD_al_Detail_Fields; 0)
ARRAY TEXT:C222(ORD_at_DetailSField; 0)
ARRAY LONGINT:C221(ORD_al_Detail_SFieldType; 0)
ARRAY TEXT:C222(ORD_at_DetailStrings; 0; 0)
ARRAY INTEGER:C220(ORD_ai_Detail_Integer; 0; 0)
ARRAY LONGINT:C221(ORD_al_Detail_Longint; 0; 0)
ARRAY REAL:C219(ORD_ar_Detail_Real; 0; 0)
ARRAY DATE:C224(ORD_ad_Detail_Date; 0; 0)
ARRAY BOOLEAN:C223(ORD_abo_DetailBoolean; 0; 0)
ARRAY TEXT:C222(ORD_at_Detail_Text; 0; 0)

$_l_CountDetails:=0
$_l_Index:=$1
If (Size of array:C274(DM_at_FieldData)>=$_l_index)
	Repeat 
		IDLE:C311
		$_l_CountDetails:=$_l_CountDetails+1
		For ($_l_FieldsIndex; 1; Size of array:C274(DM_at_FieldData{$_l_index}))
			Case of 
				: (DM_al_DBTableNUM{$_l_FieldsIndex}=Table:C252(->[ORDERS:24]))  //header
					If (DM_al_DBFieldNUM{$_l_FieldsIndex}>0)
						$_l_SourcePosition:=Find in array:C230(ORD_al_Header_Fields; DM_al_DBFieldNUM{$_l_FieldsIndex})
						If ($_l_SourcePosition<0)
							$_l_ArraySize:=Size of array:C274(ORD_al_Header_Fields)+1
							INSERT IN ARRAY:C227(ORD_al_Header_Fields; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(ORD_at_HeaderSField; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(ORD_al_Header_SFieldType; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(ORD_at_HeaderString; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(ORD_al_Header_Integer; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(ORD_al_Header_Longint; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(ORD_ar_Header_Real; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(ORD_ad_Header_Date; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(ORD_aB_Header_Boolean; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(ORD_at_Header_Text; $_l_ArraySize; 1)
							$_l_SourcePosition:=Size of array:C274(ORD_al_Header_Fields)
						End if 
						ORD_al_Header_Fields{$_l_SourcePosition}:=DM_al_DBFieldNUM{$_l_FieldsIndex}
						ORD_at_HeaderSField{$_l_SourcePosition}:=DM_at_BKDataFieldNM{$_l_FieldsIndex}
						//because we know all the data is in alpha format
						ORD_al_Header_SFieldType{$_l_SourcePosition}:=Is text:K8:3
						ORD_at_Header_Text{$_l_SourcePosition}:=DM_at_FieldData{$_l_index}{$_l_FieldsIndex}
					End if 
					
				: (DM_al_DBTableNUM{$_l_FieldsIndex}=Table:C252(->[ORDER_ITEMS:25]))  //Detail
					If (Size of array:C274(ORD_at_DetailStrings)<$_l_CountDetails)
						ARRAY TEXT:C222(ORD_at_DetailStrings; $_l_CountDetails; Size of array:C274(ORD_al_Detail_Fields))
						ARRAY INTEGER:C220(ORD_ai_Detail_Integer; $_l_CountDetails; Size of array:C274(ORD_al_Detail_Fields))
						ARRAY LONGINT:C221(ORD_al_Detail_Longint; $_l_CountDetails; Size of array:C274(ORD_al_Detail_Fields))
						ARRAY REAL:C219(ORD_ar_Detail_Real; $_l_CountDetails; Size of array:C274(ORD_al_Detail_Fields))
						ARRAY DATE:C224(ORD_ad_Detail_Date; $_l_CountDetails; Size of array:C274(ORD_al_Detail_Fields))
						ARRAY BOOLEAN:C223(ORD_abo_DetailBoolean; $_l_CountDetails; Size of array:C274(ORD_al_Detail_Fields))
						ARRAY TEXT:C222(ORD_at_Detail_Text; $_l_CountDetails; Size of array:C274(ORD_al_Detail_Fields))
					End if 
					
					$_l_SourcePosition:=Find in array:C230(ORD_al_Detail_Fields; DM_al_DBFieldNUM{$_l_FieldsIndex})
					
					If ($_l_SourcePosition<0)
						$_l_ArraySize:=Size of array:C274(ORD_al_Detail_Fields)+1
						INSERT IN ARRAY:C227(ORD_al_Detail_Fields; $_l_ArraySize; 1)
						INSERT IN ARRAY:C227(ORD_at_DetailSField; $_l_ArraySize; 1)
						INSERT IN ARRAY:C227(ORD_al_Detail_SFieldType; $_l_ArraySize; 1)
						For ($_l_FieldsIndex2; 1; Size of array:C274(ORD_at_DetailStrings))
							INSERT IN ARRAY:C227(ORD_at_DetailStrings{$_l_lndex}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(ORD_ai_Detail_Integer{$_l_lndex}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(ORD_al_Detail_Longint{$_l_lndex}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(ORD_ar_Detail_Real{$_l_lndex}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(ORD_ad_Detail_Date{$_l_lndex}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(ORD_abo_DetailBoolean{$_l_lndex}; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(ORD_at_Detail_Text{$_l_lndex}; $_l_ArraySize; 1)
						End for 
						
						$_l_SourcePosition:=Size of array:C274(ORD_al_Detail_Fields)
					End if 
					ORD_al_Detail_Fields{$_l_SourcePosition}:=DM_al_DBFieldNUM{$_l_FieldsIndex}
					ORD_at_DetailSField{$_l_SourcePosition}:=DM_at_BKDataFieldNM{$_l_FieldsIndex}
					ORD_al_Detail_SFieldType{$_l_SourcePosition}:=Is text:K8:3
					//because we know all the data is in alpha format
					ORD_at_Detail_Text{$_l_CountDetails}{$_l_SourcePosition}:=DM_at_FieldData{$_l_index}{$_l_FieldsIndex}
					
					
			End case 
		End for 
		
		$_l_index:=$_l_index+1
		
	Until ($_l_index>$_l_LastRecord)
	$0:=$_l_index-1
	
	// we now have extracted a single complete order
	//  DM_l_DestinationContext:=0
	$_l_Error:=0
Else 
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
	$_l_DataSourceID:=DM_al_DataSources{Find in array:C230(DM_at_DataSources; "Business Kit")}
	$_bo_OK:=DM_Validate($2; DM_l_DestinationContext; $_l_DataSourceID; DM_l_BKOptions; "Header"; "Detail")
	If ($_bo_OK)
		//everything is ok so do post action
		If (DM_l_BKPostAction>0)
			Case of 
				: (DM_l_BKPostAction=2)  //delete recordS from BK
					For ($_l_lndex; $1; Size of array:C274(DM_at_FieldData))
						$_t_KeyFieldData2:=DM_at_FieldData{$_l_lndex}{$_l_KeyFieldNum}
						
						$_l_SlashPosition:=Position:C15("/"; $_t_KeyFieldData2)
						If ($_l_SlashPosition>0)
							$_t_KeyFieldData3:=Substring:C12($_t_KeyFieldData2; 1; $_l_SlashPosition-1)
						End if 
						If (($_t_KeyFieldData3)=($_t_KeyFieldData))
							$_t_BKQuery:="*OrderCode="+$_t_KeyFieldData2
							ARRAY TEXT:C222(DM_at_UpdateValues; 1)
							ARRAY TEXT:C222(DM_at_UpdateFields; 1)
							DM_at_UpdateValues{1}:="DEL"
							DM_at_UpdateFields{1}:="orderCode"
							DM_SetBKRecord(0; $_t_BKQuery; ->DM_at_UpdateValues{1}; ->DM_at_UpdateFields{1}; ->DM_at_UpdateValues{1}; ->DM_at_UpdateFields{1})
						Else 
							$_l_lndex:=Size of array:C274(DM_at_FieldData)+1
						End if 
					End for 
					
					
			End case 
		End if 
		
	End if 
	
Else 
	//errors
End if 
ERR_MethodTrackerReturn("DM_HandleBKORDDATA"; $_t_oldMethodName)