//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_HandleWebDIAdata
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 20:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DIA_abo_Header_Boolean;0)
	//ARRAY DATE(DIA_ad_Header_Date;0)
	//ARRAY INTEGER(DIA_ai_Header_Integer;0)
	//ARRAY LONGINT(DIA_al_Header_Fields;0)
	//ARRAY LONGINT(DIA_al_Header_Longint;0)
	//ARRAY LONGINT(DIA_al_Header_SFieldType;0)
	//ARRAY LONGINT(DM_al_DataSources;0)
	//ARRAY REAL(DIA_ar_Header_Real;0)
	//ARRAY TEXT(DIA_at_Header_Text;0)
	//ARRAY TEXT(DIA_at_HeaderSField;0)
	//ARRAY TEXT(DIA_at_HeaderStrings;0)
	//ARRAY TEXT(DM_at_DataSources;0)
	//ARRAY TEXT(DM_at_FieldData;0)
	//ARRAY TEXT(DM_at_UpdateFields;0)
	//ARRAY TEXT(DM_at_UpdateValues;0)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283($_l_AddedItemID; $_l_ArraySize; $_l_COuntDetails; $_l_Error; $_l_FieldNumber; $_l_FieldPosition; $_l_FieldsIndex; $_l_LastRecord; $_l_ListID; $_l_Row; $_l_SourceID)
	C_LONGINT:C283($_l_SourcePosition; $_l_TableNumber)
	C_POINTER:C301($_ptr_Field; $2; $3)
	C_REAL:C285($1)
	C_TEXT:C284($_t_BKQuery; $_t_oldMethodName; DM_t_DIARYCode; DM_t_ProductCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_HandleWebDIAdata")
ARRAY LONGINT:C221(DIA_al_Header_Fields; 0)
ARRAY TEXT:C222(DIA_at_HeaderSField; 0)
ARRAY LONGINT:C221(DIA_al_Header_SFieldType; 0)
ARRAY TEXT:C222(DIA_at_HeaderStrings; 0)
ARRAY INTEGER:C220(DIA_ai_Header_Integer; 0)
ARRAY LONGINT:C221(DIA_al_Header_Longint; 0)
ARRAY REAL:C219(DIA_ar_Header_Real; 0)
ARRAY DATE:C224(DIA_ad_Header_Date; 0)
ARRAY BOOLEAN:C223(DIA_abo_Header_Boolean; 0)
ARRAY TEXT:C222(DIA_at_Header_Text; 0)

$_bo_OK:=False:C215
$_l_COuntDetails:=0
$_l_LastRecord:=0
$_l_Row:=$1

If (Size of array:C274(DM_at_FieldData)>=$_l_Row)
	Repeat 
		//IDLE
		$_l_COuntDetails:=$_l_COuntDetails+1
		For ($_l_FieldsIndex; 1; Size of array:C274(DM_at_FieldData{$_l_Row}))
			$_ptr_Field:=$2->{$_l_FieldsIndex}
			$_l_TableNumber:=Table:C252($_ptr_Field)
			$_l_FieldNumber:=Field:C253($_ptr_Field)
			Case of 
				: ($_l_TableNumber=Table:C252(->[DIARY:12]))  //header
					If ($_l_FieldNumber>0)
						$_l_FieldPosition:=Find in array:C230(DIA_al_Header_Fields; $_l_FieldNumber)
						If ($_l_FieldPosition<0)
							$_l_ArraySize:=Size of array:C274(DIA_al_Header_Fields)+1
							INSERT IN ARRAY:C227(DIA_al_Header_Fields; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DIA_at_HeaderSField; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DIA_al_Header_SFieldType; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DIA_at_HeaderStrings; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DIA_ai_Header_Integer; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DIA_al_Header_Longint; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DIA_ar_Header_Real; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DIA_ad_Header_Date; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DIA_abo_Header_Boolean; $_l_ArraySize; 1)
							INSERT IN ARRAY:C227(DIA_at_Header_Text; $_l_ArraySize; 1)
							$_l_FieldPosition:=Size of array:C274(DIA_al_Header_Fields)
						End if 
						DIA_al_Header_Fields{$_l_FieldPosition}:=$_l_FieldNumber
						DIA_at_HeaderSField{$_l_FieldPosition}:=$3->{$_l_FieldsIndex}
						//because we know all the data is in alpha format
						DIA_al_Header_SFieldType{$_l_FieldPosition}:=Is text:K8:3
						DIA_at_Header_Text{$_l_FieldPosition}:=DM_at_FieldData{$_l_Row}{$_l_FieldsIndex}
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
	$_l_SourcePosition:=Find in array:C230(DM_at_DataSources; "Daybook Webserver")
	If ($_l_SourcePosition<0)
		$_l_AddedItemID:=AA_ListAddItembyID($_l_ListID; "Daybook Webserver")
		$_l_ListID:=AA_LoadListByName("Defined Data Sources"; ->DM_at_DataSources; ->DM_al_DataSources)
		
	End if 
	$_l_SourceID:=DM_al_DataSources{Find in array:C230(DM_at_DataSources; "Daybook Webserver")}
	DM_t_ProductCode:=""
	$_bo_OK:=DM_Validate($1; Table:C252(->[DIARY:12]); $_l_SourceID; 0; "Header"; ""; ->DM_t_DIARYCode)
	If (Count parameters:C259>=2)
		$3->:=DM_t_ProductCode
		//and if this created or modified a record then update the business kit
		$_t_BKQuery:=$2->
		//pack the data into a blob here
		//  BK_UpdateRecord("ITM";$_t_BKQuery;
		ARRAY TEXT:C222(DM_at_UpdateValues; 1)
		ARRAY TEXT:C222(DM_at_UpdateFields; 1)
		DM_at_UpdateValues{1}:=DM_t_ProductCode
		DM_at_UpdateFields{1}:="C04"
		//DM_SetBKRecord ($1;$2;$3;$4;->DM_at_UpdateValues;->DM_at_UpdateFields)
		
		
		
	End if 
	
Else 
	//errors
End if 
ERR_MethodTrackerReturn("DM_HandleWebDIAdata"; $_t_oldMethodName)