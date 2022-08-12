//%attributes = {}

If (False:C215)
	//Project Method Name:      DM_HandleBKCUSDATA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CUS_abo_DetailBoolean;0;0)
	//ARRAY BOOLEAN(CUS_abo_Header_Boolean;0)
	//ARRAY DATE(CUS_ad_aDetailDates;0;0)
	//ARRAY DATE(CUS_ad_HeaderDates;0)
	//ARRAY INTEGER(CUS_ai_Detail;0;0)
	//ARRAY INTEGER(CUS_ai_HeaderInteger;0)
	//ARRAY LONGINT(CUS_al_DetailFields;0)
	//ARRAY LONGINT(CUS_al_DetailLongint;0;0)
	//ARRAY LONGINT(CUS_al_DetailSFieldType;0)
	//ARRAY LONGINT(CUS_al_HeaderFields;0)
	//ARRAY LONGINT(CUS_al_HeaderLongint;0)
	//ARRAY LONGINT(CUS_al_HeaderSFieldType;0)
	//ARRAY LONGINT(DM_al_DataSources;0)
	//ARRAY LONGINT(DM_al_DBFieldNUM;0)
	//ARRAY LONGINT(DM_al_DBTableNUM;0)
	//ARRAY REAL(CUS_ar_DetailReal;0;0)
	//ARRAY REAL(CUS_ar_HeaderReal;0)
	//ARRAY TEXT(CUS_at_DETAILSFIELD;0)
	//ARRAY TEXT(CUS_at_DetailStrings;0;0)
	//ARRAY TEXT(CUS_at_HeaderSField;0)
	//ARRAY TEXT(CUS_at_HeaderStrings;0)
	//ARRAY TEXT(CUS_at_DetailText;0;0)
	//ARRAY TEXT(CUS_at_HeaderText;0)
	//ARRAY TEXT(DM_at_BKDataFieldNM;0)
	//ARRAY TEXT(DM_at_DataSources;0)
	//ARRAY TEXT(DM_at_FieldData;0)
	//ARRAY TEXT(DM_at_UpdateFields;0)
	//ARRAY TEXT(DM_at_UpdateValues;0)
	C_BOOLEAN:C305($_bo_Continue; $_bo_OK)
	C_LONGINT:C283($_l_AddedItemID; $_l_CharacterPosition; $_l_CountDetails; $_l_DetailIndex; $_l_Error; $_l_FieldsIndex; $_l_FieldsRow; $_l_Index; $_l_IndexD; $_l_KeyFIeldNum; $_l_ListID)
	C_LONGINT:C283($_l_Row; $_l_SizeofArray; DM_l_BKOptions; DM_l_BKPostAction; DM_l_DestinationContext)
	C_POINTER:C301($4; $5)
	C_REAL:C285($1; $2)
	C_TEXT:C284($_t_KeyFIeldData2; $_t_KeyFIeldData3; $_t_oldMethodName; $_t_Query; $_t_Query2; $3; DM_t_CompanyCode; DM_t_ContactCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_HandleBKCUSDATA")

//customer
//$4 ponter to contact code
//$5 ponter to company code
$_t_oldMethodName:=ERR_MethodTracker("DM_HandleBKCUSDATA")
// ```````````
//there is no "COMPANY identifier on the BK
//SO each LINE is a single contact...the company is ???
//the DAYBOOK Contact  code is stored in the field
//  CusPersoA1
$_l_Error:=0
//and the daybook company code is
//CusPersoA2
//COMPANY
For ($_l_Index; 1; Size of array:C274(DM_at_BKDataFieldNM))
	$_l_CharacterPosition:=Position:C15("CusPersoA1"; DM_at_BKDataFieldNM{$_l_Index})
	If ($_l_CharacterPosition>0)
		$_l_FieldsRow:=$_l_Index
		
		$_l_Index:=Size of array:C274(DM_at_BKDataFieldNM)
	End if 
End for 
If ($_l_FieldsRow>0)
	//it should be
	//NOTE THAT THIS IS HARD CODED
	DM_al_DBTableNUM{$_l_FieldsRow}:=Table:C252(->[CONTACTS:1])
	DM_al_DBFieldNUM{$_l_FieldsRow}:=Field:C253(->[CONTACTS:1]Contact_Code:2)
End if 
$_bo_OK:=False:C215
For ($_l_Index; 1; Size of array:C274(DM_at_BKDataFieldNM))
	$_l_CharacterPosition:=Position:C15("CusPersoA2"; DM_at_BKDataFieldNM{$_l_Index})
	If ($_l_CharacterPosition>0)
		$_l_FieldsRow:=$_l_Index
		$_l_Index:=Size of array:C274(DM_at_BKDataFieldNM)
	End if 
End for 

If ($_l_FieldsRow>0)
	//it should be
	//NOTE THAT THIS IS HARD CODED
	DM_al_DBTableNUM{$_l_FieldsRow}:=Table:C252(->[COMPANIES:2])
	DM_al_DBFieldNUM{$_l_FieldsRow}:=Field:C253(->[COMPANIES:2]Company_Code:1)
End if 

ARRAY LONGINT:C221(CUS_al_HeaderFields; 0)
ARRAY TEXT:C222(CUS_at_HeaderSField; 0)
ARRAY LONGINT:C221(CUS_al_HeaderSFieldType; 0)
ARRAY TEXT:C222(CUS_at_HeaderStrings; 0)
ARRAY INTEGER:C220(CUS_ai_HeaderInteger; 0)
ARRAY LONGINT:C221(CUS_al_HeaderLongint; 0)
ARRAY REAL:C219(CUS_ar_HeaderReal; 0)
ARRAY DATE:C224(CUS_ad_HeaderDates; 0)
ARRAY BOOLEAN:C223(CUS_abo_Header_Boolean; 0)
ARRAY TEXT:C222(CUS_at_HeaderText; 0)

//CONTACT
ARRAY LONGINT:C221(CUS_al_DetailFields; 0)
ARRAY TEXT:C222(CUS_at_DETAILSFIELD; 0)
ARRAY LONGINT:C221(CUS_al_DetailSFieldType; 0)
ARRAY TEXT:C222(CUS_at_DetailStrings; 0; 0)
ARRAY INTEGER:C220(CUS_ai_Detail; 0; 0)
ARRAY LONGINT:C221(CUS_al_DetailLongint; 0; 0)
ARRAY REAL:C219(CUS_ar_DetailReal; 0; 0)
ARRAY DATE:C224(CUS_ad_aDetailDates; 0; 0)
ARRAY BOOLEAN:C223(CUS_abo_DetailBoolean; 0; 0)
ARRAY TEXT:C222(CUS_at_DetailText; 0; 0)
$_l_CountDetails:=0
$_l_Row:=$1
$_l_CountDetails:=$_l_CountDetails+1

For ($_l_FieldsIndex; 1; Size of array:C274(DM_at_FieldData{$_l_Row}))
	Case of 
		: (DM_al_DBTableNUM{$_l_FieldsIndex}=Table:C252(->[COMPANIES:2]))  //header
			If (DM_al_DBFieldNUM{$_l_FieldsIndex}>0)
				$_l_FieldsRow:=Find in array:C230(CUS_al_HeaderFields; DM_al_DBFieldNUM{$_l_FieldsIndex})
				If ($_l_FieldsRow<0)
					$_l_SizeofArray:=Size of array:C274(CUS_al_HeaderFields)+1
					INSERT IN ARRAY:C227(CUS_al_HeaderFields; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CUS_at_HeaderSField; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CUS_al_HeaderSFieldType; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CUS_at_HeaderStrings; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CUS_ai_HeaderInteger; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CUS_al_HeaderLongint; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CUS_ar_HeaderReal; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CUS_ad_HeaderDates; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CUS_abo_Header_Boolean; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CUS_at_HeaderText; $_l_SizeofArray; 1)
					$_l_FieldsRow:=Size of array:C274(CUS_al_HeaderFields)
				End if 
				CUS_al_HeaderFields{$_l_FieldsRow}:=DM_al_DBFieldNUM{$_l_FieldsIndex}
				CUS_at_HeaderSField{$_l_FieldsRow}:=DM_at_BKDataFieldNM{$_l_FieldsIndex}
				//because we know all the data is in alpha format
				CUS_al_HeaderSFieldType{$_l_FieldsRow}:=Is text:K8:3
				CUS_at_HeaderText{$_l_FieldsRow}:=DM_at_FieldData{$_l_Row}{$_l_FieldsIndex}
			End if 
			
		: (DM_al_DBTableNUM{$_l_FieldsIndex}=Table:C252(->[CONTACTS:1]))  //Contact fields
			If (Size of array:C274(CUS_at_DetailStrings)<$_l_CountDetails)
				ARRAY TEXT:C222(CUS_at_DetailStrings; $_l_CountDetails; Size of array:C274(CUS_al_DetailFields))
				ARRAY INTEGER:C220(CUS_ai_Detail; $_l_CountDetails; Size of array:C274(CUS_al_DetailFields))
				ARRAY LONGINT:C221(CUS_al_DetailLongint; $_l_CountDetails; Size of array:C274(CUS_al_DetailFields))
				ARRAY REAL:C219(CUS_ar_DetailReal; $_l_CountDetails; Size of array:C274(CUS_al_DetailFields))
				ARRAY DATE:C224(CUS_ad_aDetailDates; $_l_CountDetails; Size of array:C274(CUS_al_DetailFields))
				ARRAY BOOLEAN:C223(CUS_abo_DetailBoolean; $_l_CountDetails; Size of array:C274(CUS_al_DetailFields))
				ARRAY TEXT:C222(CUS_at_DetailText; $_l_CountDetails; Size of array:C274(CUS_al_DetailFields))
			End if 
			
			$_l_FieldsRow:=Find in array:C230(CUS_al_DetailFields; DM_al_DBFieldNUM{$_l_FieldsIndex})
			
			If ($_l_FieldsRow<0)
				$_l_SizeofArray:=Size of array:C274(CUS_al_DetailFields)+1
				INSERT IN ARRAY:C227(CUS_al_DetailFields; $_l_SizeofArray; 1)
				INSERT IN ARRAY:C227(CUS_at_DETAILSFIELD; $_l_SizeofArray; 1)
				INSERT IN ARRAY:C227(CUS_al_DetailSFieldType; $_l_SizeofArray; 1)
				For ($_l_DetailIndex; 1; Size of array:C274(CUS_at_DetailStrings))
					INSERT IN ARRAY:C227(CUS_at_DetailStrings{$_l_DetailIndex}; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CUS_ai_Detail{$_l_DetailIndex}; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CUS_al_DetailLongint{$_l_DetailIndex}; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CUS_ar_DetailReal{$_l_DetailIndex}; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CUS_ad_aDetailDates{$_l_DetailIndex}; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CUS_abo_DetailBoolean{$_l_DetailIndex}; $_l_SizeofArray; 1)
					INSERT IN ARRAY:C227(CUS_at_DetailText{$_l_DetailIndex}; $_l_SizeofArray; 1)
				End for 
				
				$_l_FieldsRow:=Size of array:C274(CUS_al_DetailFields)
			End if 
			CUS_al_DetailFields{$_l_FieldsRow}:=DM_al_DBFieldNUM{$_l_FieldsIndex}
			CUS_at_DETAILSFIELD{$_l_FieldsRow}:=DM_at_BKDataFieldNM{$_l_FieldsIndex}
			CUS_al_DetailSFieldType{$_l_FieldsRow}:=Is text:K8:3
			//because we know all the data is in alpha format
			CUS_at_DetailText{$_l_CountDetails}{$_l_FieldsRow}:=DM_at_FieldData{$_l_Row}{$_l_FieldsIndex}
			
			//here handle other possible destinations  (eg applicant, attendee etc)
	End case 
End for 
// we now have extracted a single contact
//  DM_l_DestinationContext:=0


If ($_l_Error=0)
	
	ARRAY LONGINT:C221(DM_al_DataSources; 0)
	ARRAY TEXT:C222(DM_at_DataSources; 0)
	$_l_ListID:=AA_LoadListByName("Defined Data Sources"; ->DM_at_DataSources; ->DM_al_DataSources)
	$_l_FieldsRow:=Find in array:C230(DM_at_DataSources; "Business Kit")
	If ($_l_FieldsRow<0)
		$_l_AddedItemID:=AA_ListAddItembyID($_l_ListID; "Business Kit")
		$_l_ListID:=AA_LoadListByName("Defined Data Sources"; ->DM_at_DataSources; ->DM_al_DataSources)
	End if 
	$_l_IndexD:=DM_al_DataSources{Find in array:C230(DM_at_DataSources; "Business Kit")}
	//here we can test if the record exists
	If (Count parameters:C259>=3)
		$_bo_Continue:=True:C214
		$_l_FieldsRow:=Find in array:C230(CUS_at_DETAILSFIELD; "CusPersoA1")
		If ($_l_FieldsRow>0)
			If (CUS_at_DetailText{1}{$_l_FieldsRow}#"")
				$4->:=CUS_at_DetailText{1}{$_l_FieldsRow}
				$_bo_Continue:=False:C215
			End if 
		End if 
		$_l_FieldsRow:=Find in array:C230(CUS_at_HeaderSField; "CusPersoA2")
		If ($_l_FieldsRow>0)
			If (CUS_at_HeaderText{$_l_FieldsRow}#"")
				
				$5->:=CUS_at_HeaderText{$_l_FieldsRow}
			End if 
		End if 
	Else 
		$_bo_Continue:=True:C214
	End if 
	If ($_bo_Continue)
		DM_t_CompanyCode:=""
		DM_t_ContactCode:=""
		$_bo_OK:=DM_Validate($2; DM_l_DestinationContext; $_l_IndexD; DM_l_BKOptions; "Header"; "Detail"; ->DM_t_CompanyCode; ->DM_t_ContactCode)
		$5->:=DM_t_CompanyCode
		$4->:=DM_t_ContactCode
		//and if this created or modified a record then update the business kit
		$_t_Query:=$3
		//pack the data into a blob here
		If (Count parameters:C259>=2)
			//pack the data into a blob here
			//  BK_UpdateRecord("ITM";$_t_Query;
			ARRAY TEXT:C222(DM_at_UpdateValues; 2)
			ARRAY TEXT:C222(DM_at_UpdateFields; 2)
			DM_at_UpdateValues{1}:=DM_t_CompanyCode
			DM_at_UpdateValues{2}:=DM_t_ContactCode
			DM_at_UpdateFields{1}:="CusPersoA2"
			DM_at_UpdateFields{2}:="CusPersoA1"
			DM_SetBKRecord($2; $3; $4; $5; ->DM_at_UpdateValues; ->DM_at_UpdateFields)
		End if 
		If ($_bo_OK)
			//everything is ok so do post action
			If (DM_l_BKPostAction>0)
				Case of 
					: (DM_l_BKPostAction=2)  //delete recordS from BK
						$_l_KeyFIeldNum:=Find in array:C230(DM_at_BKDataFieldNM; "cuscode")
						$_t_KeyFIeldData2:=DM_at_FieldData{$1}{$_l_KeyFIeldNum}
						$_l_CharacterPosition:=Position:C15("/"; $_t_KeyFIeldData2)
						If ($_l_CharacterPosition>0)
							$_t_KeyFIeldData3:=Substring:C12($_t_KeyFIeldData2; 1; $_l_CharacterPosition-1)
						End if 
						$_t_Query2:="*OrderCode="+$_t_KeyFIeldData2
						ARRAY TEXT:C222(DM_at_UpdateValues; 1)
						ARRAY TEXT:C222(DM_at_UpdateFields; 1)
						DM_at_UpdateValues{1}:="DEL"
						DM_at_UpdateFields{1}:="C01"
						DM_SetBKRecord(0; $_t_Query2; ->DM_at_UpdateValues{1}; ->DM_at_UpdateFields{1}; ->DM_at_UpdateValues{1}; ->DM_at_UpdateFields{1})
				End case 
			End if 
			
		End if 
		
	End if 
	
Else 
	//errors
End if 
ERR_MethodTrackerReturn("DM_HandleBKCUSDATA"; $_t_oldMethodName)