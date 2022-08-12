//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_DBEdit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 10:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_WebListID; 0)
	//ARRAY LONGINT(IME_al_DefColPos;0)
	//ARRAY POINTER(IME_aptr_DefField;0)
	ARRAY TEXT:C222($_at_FormatChecked; 0)
	ARRAY TEXT:C222($_at_FormatShow; 0)
	ARRAY TEXT:C222($_at_FormatValue; 0)
	ARRAY TEXT:C222($_at_WebListData; 0)
	//ARRAY TEXT(IME_at_DefAlign;0)
	//ARRAY TEXT(IME_at_DefData;0)
	//ARRAY TEXT(IME_at_DefITX;0)
	//ARRAY TEXT(IME_at_DefJavascript;0)
	//ARRAY TEXT(IME_at_DefLabel;0)
	//ARRAY TEXT(IME_at_DefMaxSize;0)
	//ARRAY TEXT(IME_at_DefName;0)
	//ARRAY TEXT(IME_at_DEFREQUIRED;0)
	//ARRAY TEXT(IME_at_DefRows;0)
	//ARRAY TEXT(IME_at_DefSize;0)
	C_BOOLEAN:C305($_bo_Draw; $_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique; $_bo_First; $_bo_FirstTime; $_bo_Handled; $_bo_InRowStart; $_bo_LastChunk; $_bo_New; $_bo_ReadWrite)
	C_LONGINT:C283($_l_ArraySize; $_l_BarPosition; $_l_CharacterPosition; $_l_ColumnCount; $_l_ColumnIndex; $_l_ColumnSpan; $_l_CountData; $_l_CountDividers; $_l_CRPosition; $_l_DataPosition; $_l_ElemIndex)
	C_LONGINT:C283($_l_EndTableSquarePosition; $_l_FieldLength; $_l_FieldsCount; $_l_FieldType; $_l_FormatCount; $_l_INSResult; $_l_ListID; $_l_MaxColumnSpan; $_l_Number; $_l_Page; $_l_RecordsCount)
	C_LONGINT:C283($_l_RW; $_l_ScriptRow; $_l_SelectedRecordNumber; $_l_SemiColonPosition; $_l_SlashPosition; $_l_SortColumn)
	C_POINTER:C301($_Ptr_FieldPointer; $_ptr_Table)
	C_TEXT:C284(<>GEN_t_OK; <>STR_t_CR; $_t_Chunk; $_t_ColumnSpan; $_t_Command; $_t_CR; $_t_Data; $_t_DefaultITX; $_t_DefinitionName; $_t_DeleteDIS; $_t_Direct)
	C_TEXT:C284($_t_DQ; $_t_EditDefinition; $_t_ErrorText; $_t_Fields; $_t_Fields3Name; $_t_FieldsAfter; $_t_FieldType; $_t_FInd; $_t_FindDIS; $_t_Format; $_t_FormatChunk)
	C_TEXT:C284($_t_FromPage; $_t_FunctionName; $_t_FunctionTitle; $_t_InitialCommands; $_t_ITX; $_t_JavascriptDefault; $_t_LastSortDIrection; $_t_NamedSelection; $_t_NewDIS; $_t_NextDis; $_t_oldMethodName)
	C_TEXT:C284($_t_PopUP; $_t_PreviousDIS; $_t_RelatedValue; $_t_Result; $_t_RightHeading; $_t_SaveDIS; $_t_Sort; $_t_Submit; $_t_Table; $1; IME_t_UserGroupCode)
	C_TEXT:C284(IME_t_UserInitials; vWebRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_DBEdit")
//IME_DBEdit
//Rollo 11/6/2004

//Draw an Edit or New page for any table supported in the generic interface


$_t_Direct:=$1  //the page url
$_t_FunctionName:=Substring:C12($_t_Direct; 7; 15)  //eg DBEditCompanies -> Companies, max length 15
$_t_DQ:=Char:C90(34)

//$_t_Submit:=IME_FieldValue ("submit")
Case of 
	: (IME_FieldValue("save")#"")
		$_t_Submit:="Save"
	: (IME_FieldValue("delete")#"")
		$_t_Submit:="Delete"
	: (IME_FieldValue("first")#"")
		$_t_Submit:="First"
	: (IME_FieldValue("previous")#"")
		$_t_Submit:="Previous"
	: (IME_FieldValue("next")#"")
		$_t_Submit:="Next"
	: (IME_FieldValue("last")#"")
		$_t_Submit:="Last"
	: (IME_FieldValue("find")#"")
		$_t_Submit:="Find"
	: (IME_FieldValue("new")#"")
		$_t_Submit:="New"
	: (IME_FieldValue("delete")#"")
		$_t_Submit:="Delete"
	Else 
		$_t_Submit:=""  //just arriving for the first time
End case 

$_t_FromPage:=IME_FieldValue("frompage")
$_l_RW:=Num:C11(IME_FieldValue("rw"))

//loaded in order to pass on again, back to the list
$_l_Page:=Num:C11(IME_Parameter("Page"))
$_t_Sort:=IME_Parameter("Sort")
$_t_Command:=IME_Parameter("Cmd")  //Command
$_t_LastSortDIrection:=IME_Parameter("Direction")
$_l_SortColumn:=Num:C11(IME_Parameter("SortedColumn"))
$_l_Number:=Num:C11(IME_Parameter("No"))

$_l_SelectedRecordNumber:=Num:C11(IME_Parameter("item"))

$_t_FunctionTitle:=Uppers3(Lowercase:C14($_t_FunctionName))  //by default use the url name
//**** then get the singular name from the function

$_t_CR:=<>STR_t_CR
$_l_Number:=0
$_t_ErrorText:=""
//set a default default

$_bo_ReadWrite:=True:C214  //read from Function arrays
If ($_bo_ReadWrite)
	$_t_RightHeading:="Editable"
	$_t_SaveDIS:="false"
	$_t_NewDIS:="false"
	$_t_DeleteDIS:="false"
Else 
	$_t_RightHeading:="View Only"
	$_t_SaveDIS:="true"
	$_t_NewDIS:="true"
	$_t_DeleteDIS:="true"
End if 
$_t_FindDIS:="false"

$_bo_New:=($_t_Submit="New")

//**** saving edited data
If ((($_t_Submit="Save") | ($_bo_New) | ($_t_Submit="Next") | ($_t_Submit="Last") | ($_t_Submit="< Previous") | ($_t_Submit="First >")) & ($_bo_ReadWrite) & ($_l_RW=1))  //double test of Read Write
	
	
	
End if 

$_bo_Draw:=True:C214

Case of 
		
	: ($_t_Submit="New")  //clicked the New button
		IME_DBEdit("DBEdit"+$_t_FunctionName)
		$_bo_Draw:=False:C215
		
	: (($_t_Submit="Find") & ($_t_FromPage="Edit"))  //clicked the Find button
		IME_DBFind("DBFind"+$_t_FunctionName)
		$_bo_Draw:=False:C215
		
	: ($_t_Submit="Save")  //clicked the Save button - drop back to list
		IME_DBFind("DBList"+$_t_FunctionName)
		$_bo_Draw:=False:C215
		
	: ($_t_Submit="Next@")
		$_l_SelectedRecordNumber:=$_l_SelectedRecordNumber+1
		
	: ($_t_Submit="Previous@")
		$_l_SelectedRecordNumber:=$_l_SelectedRecordNumber-1
		If ($_l_SelectedRecordNumber<1)
			$_l_SelectedRecordNumber:=1
		End if 
		
	: ($_t_Submit="Last@")
		$_l_SelectedRecordNumber:=9999999
		
	: ($_t_Submit="First@")
		$_l_SelectedRecordNumber:=1
		
End case 

If ($_bo_Draw)
	
	Case of 
			
		: ($_t_FunctionName="Companies@")
			$_ptr_Table:=->[COMPANIES:2]
			
		: ($_t_FunctionName="Contacts@")
			$_ptr_Table:=->[CONTACTS:1]
			
		: ($_t_FunctionName="Products@")
			$_ptr_Table:=->[PRODUCTS:9]
			
		: ($_t_FunctionName="Orders@")
			$_ptr_Table:=->[ORDERS:24]
			
		: ($_t_FunctionName="Diary@")
			$_ptr_Table:=->[DIARY:12]
			
		: ($_t_FunctionName="ServiceCalls@")
			$_ptr_Table:=->[SERVICE_CALLS:20]
			$_t_FunctionTitle:="Service Calls"
			
		Else 
			
			$_t_FunctionTitle:="Nothing"
			$_l_Number:=0
			$_t_FInd:=""
			$_ptr_Table:=->[COMPANIES:2]
			
	End case 
	
	
	If ($_l_Page=0)  //first time- just arrived from a Find
		
		$_l_Number:=Records in selection:C76($_ptr_Table->)
		$_bo_FirstTime:=True:C214
		$_l_Page:=1
		$_t_Sort:=""
		
	Else 
		
		$_bo_FirstTime:=False:C215
		
	End if 
	
	$_t_Direct:="DBEdit"+$_t_FunctionName+"?item="+String:C10($_l_SelectedRecordNumber)+"&page="+String:C10($_l_Page)+"&sort="+$_t_Sort+"&no="+String:C10($_l_Number)+"&sortedcolumn="+String:C10($_l_SortColumn)
	
	
	//add to action `+"&page="+String($_l_Page)+"&sort="+$_t_Sort+"&no="+String($_l_Number)+"&sortedcolumn="+String($_l_SortColumn)
	
	//get the text that defines the columns - eg ITX DBListCompanies (or with Initials on the end)
	$_t_DefinitionName:="Edit"+$_t_FunctionName+IME_t_UserInitials
	$_t_EditDefinition:=IME_Text2("ITX DB"+$_t_DefinitionName)  //specific to the Person
	If ($_t_EditDefinition#"@data=@")
		$_t_DefinitionName:="Edit"+$_t_FunctionName+"_"+IME_t_UserGroupCode
		$_t_EditDefinition:=IME_Text2("ITX DB"+$_t_DefinitionName)  //specific to the Peronnel Group
		If ($_t_EditDefinition#"@data=@")
			$_t_DefinitionName:="Edit"+$_t_FunctionName
			$_t_EditDefinition:=IME_Text2("ITX DB"+$_t_DefinitionName)  //the default for this table"
		End if 
	End if 
	If ($_t_EditDefinition="")
		$_t_EditDefinition:=IME_DBEditDefCreate($_t_FunctionName; $_ptr_Table)
	End if 
	
	//silly repetition of below, but required uncomp
	ARRAY POINTER:C280(IME_aptr_DefField; 0)
	ARRAY LONGINT:C221(IME_al_DefColPos; 0)
	ARRAY TEXT:C222(IME_at_DefData; 0)
	ARRAY TEXT:C222(IME_at_DefLabel; 0)
	ARRAY TEXT:C222(IME_at_DefSize; 0)
	ARRAY TEXT:C222(IME_at_DefRows; 0)
	ARRAY TEXT:C222(IME_at_DefMaxSize; 0)
	ARRAY TEXT:C222(IME_at_DefAlign; 0)
	ARRAY TEXT:C222(IME_at_DefITX; 0)
	ARRAY TEXT:C222(IME_at_DefName; 0)
	ARRAY TEXT:C222(IME_at_DefJavascript; 0)
	ARRAY TEXT:C222(IME_at_DEFREQUIRED; 0)
	
	//retrieve the processed arrays from a cache
	$_t_Result:=IME_CachedDataGet($_t_DefinitionName; "IME_al_DefColPos"; "IME_at_DefData"; "IME_at_DefLabel"; "IME_at_DefSize"; "IME_at_DefRows"; "IME_at_DefMaxSize"; "IME_at_DefAlign"; "IME_at_DefITX"; "IME_at_DefName"; "IME_at_DefJavascript"; "IME_at_DEFREQUIRED")
	
	If ($_t_Result=<>GEN_t_OK)  //if found in cache
		
		$_l_ColumnCount:=(Size of array:C274(IME_at_DefData))
		If ($_l_ColumnCount=0)
			$_t_ErrorText:="The Edit columns for this Function are not defined - "+"please create ITX DBEdit"+$_t_FunctionName+", and optionally ITX DBEdit"+$_t_FunctionName+IME_t_UserInitials
		Else 
			$_l_CountData:=STR_CountStr($_t_EditDefinition; "data=")
			ARRAY POINTER:C280(IME_aptr_DefField; $_l_CountData)  //these weren't put in the cache - will need to get them if we need then
		End if 
		
	Else   //if not, produce them
		
		//arrays for the Edit definitions
		$_l_CountData:=STR_CountStr($_t_EditDefinition; "data=")
		ARRAY POINTER:C280(IME_aptr_DefField; $_l_CountData)
		ARRAY LONGINT:C221(IME_al_DefColPos; $_l_CountData)
		ARRAY TEXT:C222(IME_at_DefData; $_l_CountData)
		ARRAY TEXT:C222(IME_at_DefLabel; $_l_CountData)
		ARRAY TEXT:C222(IME_at_DefSize; $_l_CountData)
		ARRAY TEXT:C222(IME_at_DefRows; $_l_CountData)
		ARRAY TEXT:C222(IME_at_DefMaxSize; $_l_CountData)
		ARRAY TEXT:C222(IME_at_DefAlign; $_l_CountData)
		ARRAY TEXT:C222(IME_at_DefITX; $_l_CountData)
		ARRAY TEXT:C222(IME_at_DefName; $_l_CountData)
		ARRAY TEXT:C222(IME_at_DefJavascript; $_l_CountData)
		ARRAY TEXT:C222(IME_at_DEFREQUIRED; $_l_CountData)
		
		//interpret the Edit definitions
		$_l_DataPosition:=Position:C15("data="; $_t_EditDefinition)
		
		$_l_ColumnCount:=0
		$_bo_InRowStart:=False:C215
		$_l_ColumnSpan:=0
		$_l_MaxColumnSpan:=1
		
		If ($_l_DataPosition>0)  //all Edit definitions must have at least one of these
			
			$_t_InitialCommands:=Substring:C12($_t_EditDefinition; 1; $_l_DataPosition-1)
			If (Position:C15("RowStart"+$_t_CR; $_t_InitialCommands)>0)
				$_bo_InRowStart:=True:C214
			End if 
			
			$_t_EditDefinition:=Substring:C12($_t_EditDefinition; $_l_DataPosition)  //remove any leading CRs etc
			$_t_EditDefinition:=$_t_EditDefinition+$_t_CR  //just to ensure there's one at the end
			
			While ($_l_DataPosition>0)
				
				$_l_CRPosition:=Position:C15($_t_CR; $_t_EditDefinition)
				$_t_Data:=Substring:C12($_t_EditDefinition; 6; $_l_CRPosition-6)
				$_t_EditDefinition:=Substring:C12($_t_EditDefinition; $_l_CRPosition+1)
				$_l_DataPosition:=Position:C15("Data="; $_t_EditDefinition)
				If ($_l_DataPosition>0)
					$_t_Chunk:=Substring:C12($_t_EditDefinition; 1; $_l_DataPosition-1)
					$_t_EditDefinition:=Substring:C12($_t_EditDefinition; $_l_DataPosition)
				Else 
					$_t_Chunk:=$_t_EditDefinition
					$_t_EditDefinition:=""
				End if 
				
				If ($_t_Data#"")
					
					If ($_l_ColumnCount<$_l_CountData)
						$_l_ColumnCount:=$_l_ColumnCount+1
						$_l_ColumnIndex:=$_l_ColumnCount  //copied for clarity of lines below
						
						//defaults
						$_l_FieldType:=-1  //must be a variable or other
						$_l_FieldLength:=20
						$_bo_FieldIndexed:=False:C215
						$_bo_FieldUnique:=False:C215
						$_bo_FieldInvisible:=False:C215
						$_t_DefaultITX:="ITX DGEdit"
						$_t_JavascriptDefault:="inputChange"
						
						//read the column definitions & set defaults
						IME_at_DefData{$_l_ColumnIndex}:=STR_RemoveLeadTrailSpace($_t_Data)
						
						//RowStart and RowEnd allow optional use of 2 columns for input fields
						If ($_bo_InRowStart)
							$_l_ColumnSpan:=$_l_ColumnSpan+1
							IME_al_DefColPos{$_l_ColumnIndex}:=$_l_ColumnSpan
							If ($_l_ColumnSpan>$_l_MaxColumnSpan)
								$_l_MaxColumnSpan:=$_l_ColumnSpan
							End if 
						End if 
						If ((Position:C15("RowEnd"+$_t_CR; $_t_Chunk)>0) | (($_bo_InRowStart) & ($_t_EditDefinition="")))
							$_bo_InRowStart:=False:C215
							$_l_ColumnSpan:=0
						End if 
						If (Position:C15("RowStart"+$_t_CR; $_t_Chunk)>0)
							$_bo_InRowStart:=True:C214
						End if 
						
						//read properties of fields
						Case of 
							: (IME_at_DefData{$_l_ColumnIndex}="[@")
								
								$_l_SemiColonPosition:=Position:C15(";"; IME_at_DefData{$_l_ColumnIndex})
								If ($_l_SemiColonPosition>0)
									$_Ptr_FieldPointer:=UTI_FieldPointerFromString(Substring:C12(IME_at_DefData{$_l_ColumnIndex}; 1; $_l_SemiColonPosition-1))  // NG September 2004 correct a compilter error
								Else 
									$_Ptr_FieldPointer:=UTI_FieldPointerFromString(IME_at_DefData{$_l_ColumnIndex})
								End if 
								
								If (Not:C34(Is nil pointer:C315($_Ptr_FieldPointer)))
									
									IME_aptr_DefField{$_l_ColumnIndex}:=$_Ptr_FieldPointer
									
									GET FIELD PROPERTIES:C258($_Ptr_FieldPointer; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
									Case of 
										: ($_l_FieldType=0)  //alpha
											//use the real field length
											
										: ($_l_FieldType=2)  //text
											$_l_FieldLength:=255  //default length for text fields displayed in normal inputs
											$_t_DefaultITX:="ITX DGEditTextArea"
											//**default rows and width for real texts
											
										: ($_l_FieldType=1)  //real
											If ($_l_SemiColonPosition=0)
												IME_at_DefData{$_l_ColumnIndex}:=IME_at_DefData{$_l_ColumnIndex}+";|Accounts"  //default reals to accounts format
											End if 
											$_l_FieldLength:=15
											
										: ($_l_FieldType=8)  //integer
											$_l_FieldLength:=10
											
										: ($_l_FieldType=9)  //longint
											$_l_FieldLength:=10
											
										: ($_l_FieldType=4)  //date
											If ($_l_SemiColonPosition=0)
												IME_at_DefData{$_l_ColumnIndex}:=IME_at_DefData{$_l_ColumnIndex}+";"+String:C10(System date short:K1:1)  //default Dates to Short format
											End if 
											$_l_FieldLength:=10
											
										: ($_l_FieldType=11)  //time
											If ($_l_SemiColonPosition=0)
												IME_at_DefData{$_l_ColumnIndex}:=IME_at_DefData{$_l_ColumnIndex}+";"+String:C10(HH MM:K7:2)  //default Dates to Short format
											End if 
											$_l_FieldLength:=7
											
										: ($_l_FieldType=6)  //boolean
											$_l_FieldLength:=5
											$_t_DefaultITX:="ITX DGEditCheckbox"
											
											//*** Is Picture
											//3
									End case 
								End if 
								
							: ((IME_at_DefData{$_l_ColumnIndex}="FF[@") | (IME_at_DefData{$_l_ColumnIndex}="Further Field[@"))  //a Further Field
								
								$_l_SemiColonPosition:=Position:C15(";"; IME_at_DefData{$_l_ColumnIndex})
								If ($_l_SemiColonPosition>0)
									$_t_Data:=Substring:C12(IME_at_DefData{$_l_ColumnIndex}; 1; $_l_SemiColonPosition-1)
								Else 
									$_t_Data:=IME_at_DefData{$_l_ColumnIndex}
								End if 
								
								$_l_EndTableSquarePosition:=Position:C15("]"; $_t_Data)
								If ($_l_EndTableSquarePosition>0)
									If (IME_at_DefData{$_l_ColumnIndex}="FF[@")
										$_t_Table:=Substring:C12($_t_Data; 4; $_l_EndTableSquarePosition-4)
									Else 
										$_t_Table:=Substring:C12($_t_Data; 15; $_l_EndTableSquarePosition-15)
									End if 
									$_t_Data:=Substring:C12($_t_Data; $_l_EndTableSquarePosition+1)
								End if 
								
								$_t_FieldType:=FurthFld_Type($_t_Table; $_t_Data)
								Case of 
									: ($_t_FieldType="A")  //alpha
										$_l_FieldLength:=31
									: ($_t_FieldType="N")  //number
										$_l_FieldLength:=10
									: ($_t_FieldType="D")  //date
										$_l_FieldLength:=10
										If ($_l_SemiColonPosition=0)
											IME_at_DefData{$_l_ColumnIndex}:=IME_at_DefData{$_l_ColumnIndex}+";"+String:C10(System date short:K1:1)  //default Dates to Short format
										End if 
									Else   //T for Text
										$_l_FieldLength:=255  //default length for text fields displayed in normal inputs
										$_t_DefaultITX:="ITX DGEditTextArea"
								End case 
								
						End case 
						
						Case of 
								
							: ((IME_at_DefData{$_l_ColumnIndex}="@|@") & (IME_at_DefData{$_l_ColumnIndex}#"@;|@"))  //turns into radio buttons if eg format ;This|That|The other
								$_l_CountDividers:=STR_CountStr(IME_at_DefData{$_l_ColumnIndex}; "|")+1
								If ($_l_CountDividers<5)
									$_t_DefaultITX:="ITX DGEditRadio"+String:C10($_l_CountDividers)
								Else   //or into a fixed-value popup if >4 options.  Optional format - THIS/This|THAT/That|OTHER/The other
									$_t_DefaultITX:="ITX DGEditPopup"
								End if 
								
							: (IME_at_DefData{$_l_ColumnIndex}="@;List=@")
								$_t_DefaultITX:="ITX DGEditPopup"
								
							: (IME_at_DefData{$_l_ColumnIndex}="@;Lookup=@")
								$_t_DefaultITX:="ITX DGEditLookup"
								$_t_Fields:=STR_RemoveLeadTrailSpace(Replace string:C233(Replace string:C233(Replace string:C233(Substring:C12(IME_at_DefData{$_l_ColumnIndex}; $_l_SemiColonPosition+9); "_"; "UNDERSSS"); "["; ""); "]"; "-"))
								$_l_CharacterPosition:=Position:C15("/"; $_t_Fields)
								$_l_FieldsCount:=1
								$_t_Fields3Name:=""
								While ($_l_CharacterPosition>0)
									$_l_FieldsCount:=$_l_FieldsCount+1
									$_t_FieldsAfter:=Substring:C12($_t_Fields; $_l_CharacterPosition+1)
									$_t_Fields:=Substring:C12($_t_Fields; 1; $_l_CharacterPosition-1)+"&field"+String:C10($_l_FieldsCount)+"="+$_t_FieldsAfter
									If ($_l_FieldsCount=3)
										$_l_CharacterPosition:=Position:C15("/"; $_t_FieldsAfter)
										$_t_Fields3Name:=Substring:C12($_t_FieldsAfter; 1; $_l_CharacterPosition-1)
									End if 
									$_l_CharacterPosition:=Position:C15("/"; $_t_Fields)
								End while 
								$_t_JavascriptDefault:="inputLookup(this,'"+IME_DBEncrypt("DBLookup?field1="+$_t_Fields)+"','"+Replace string:C233(Replace string:C233($_t_Fields3Name; "UNDERSSS"; "_"); " "; "_")+"')"
								
						End case 
						
						IME_at_DefLabel{$_l_ColumnIndex}:=Substring:C12(IME_DBListDefinitionFind("Label"; $_t_Chunk); 1; 79)
						If (IME_at_DefLabel{$_l_ColumnIndex}="")
							IME_at_DefLabel{$_l_ColumnIndex}:="&nbsp;"  //allowed a blank label, but want something to fill the TD
						Else 
							IME_at_DefLabel{$_l_ColumnIndex}:=Replace string:C233(IME_at_DefLabel{$_l_ColumnIndex}; " "; "&nbsp;")  //non-breaking space
						End if 
						IME_at_DefSize{$_l_ColumnIndex}:=Substring:C12(IME_DBListDefinitionFind("Size"; $_t_Chunk); 1; 11)
						If (IME_at_DefSize{$_l_ColumnIndex}="")
							IME_at_DefSize{$_l_ColumnIndex}:=Substring:C12(IME_DBListDefinitionFind("Cols"; $_t_Chunk); 1; 11)
							If (IME_at_DefSize{$_l_ColumnIndex}="")
								If ($_l_FieldLength>60)
									IME_at_DefSize{$_l_ColumnIndex}:="60"
								Else 
									IME_at_DefSize{$_l_ColumnIndex}:=String:C10($_l_FieldLength)
								End if 
							End if 
						End if 
						IME_at_DefRows{$_l_ColumnIndex}:=Substring:C12(IME_DBListDefinitionFind("Rows"; $_t_Chunk); 1; 11)  //for textarea only
						If (IME_at_DefRows{$_l_ColumnIndex}="")
							IME_at_DefRows{$_l_ColumnIndex}:="4"
						End if 
						IME_at_DefMaxSize{$_l_ColumnIndex}:=Substring:C12(IME_DBListDefinitionFind("MaxSize"; $_t_Chunk); 1; 11)
						If (IME_at_DefMaxSize{$_l_ColumnIndex}="")
							IME_at_DefMaxSize{$_l_ColumnIndex}:=String:C10($_l_FieldLength)
						End if 
						IME_at_DefAlign{$_l_ColumnIndex}:=Substring:C12(IME_DBListDefinitionFind("Align"; $_t_Chunk); 1; 11)
						If (IME_at_DefAlign{$_l_ColumnIndex}="")
							IME_at_DefAlign{$_l_ColumnIndex}:="Left"
						End if 
						IME_at_DefITX{$_l_ColumnIndex}:=Substring:C12(IME_DBListDefinitionFind("ITX"; $_t_Chunk); 1; 31)
						Case of 
							: (IME_at_DefITX{$_l_ColumnIndex}="")
								IME_at_DefITX{$_l_ColumnIndex}:=$_t_DefaultITX
							: (IME_at_DefITX{$_l_ColumnIndex}#"ITX @")
								IME_at_DefITX{$_l_ColumnIndex}:="ITX "+IME_at_DefITX{$_l_ColumnIndex}
						End case 
						IME_at_DefName{$_l_ColumnIndex}:=Substring:C12(IME_DBListDefinitionFind("Name"; $_t_Chunk); 1; 31)
						Case of 
							: (IME_at_DefName{$_l_ColumnIndex}="")
								IME_at_DefName{$_l_ColumnIndex}:=Replace string:C233(Substring:C12(IME_at_DefData{$_l_ColumnIndex}; 1; 31); " "; "_")
								$_l_SemiColonPosition:=Position:C15(";"; IME_at_DefName{$_l_ColumnIndex})
								If ($_l_SemiColonPosition>0)
									IME_at_DefName{$_l_ColumnIndex}:=Substring:C12(IME_at_DefName{$_l_ColumnIndex}; 1; $_l_SemiColonPosition-1)
								End if 
								
						End case 
						If (IME_at_DefName{$_l_ColumnIndex}="[@")
							IME_at_DefName{$_l_ColumnIndex}:=Replace string:C233(Substring:C12(IME_at_DefName{$_l_ColumnIndex}; 2); "]"; "-")
						End if 
						IME_at_DefJavascript{$_l_ColumnIndex}:=IME_DBListDefinitionFind("Javascript"; $_t_Chunk)
						If (IME_at_DefJavascript{$_l_ColumnIndex}="")
							IME_at_DefJavascript{$_l_ColumnIndex}:=$_t_JavascriptDefault
						End if 
						If ((IME_at_DefJavascript{$_l_ColumnIndex}#"") & (IME_at_DefJavascript{$_l_ColumnIndex}#"@(@") & (IME_at_DefJavascript{$_l_ColumnIndex}#"@ @"))
							IME_at_DefJavascript{$_l_ColumnIndex}:=IME_at_DefJavascript{$_l_ColumnIndex}+"(this)"  //always pass as a param if only one function name called
						End if 
						IME_at_DEFREQUIRED{$_l_ColumnIndex}:=Substring:C12(IME_DBListDefinitionFind("Required"; $_t_Chunk); 1; 3)
						If ((IME_at_DEFREQUIRED{$_l_ColumnIndex}="Y@") & ($_bo_ReadWrite))
							IME_at_DEFREQUIRED{$_l_ColumnIndex}:="Yes"
							IME_at_DefITX{$_l_ColumnIndex}:=IME_at_DefITX{$_l_ColumnIndex}+"Req"
						Else 
							IME_at_DEFREQUIRED{$_l_ColumnIndex}:="No"
						End if 
					End if 
					
				End if 
				
			End while 
			
		Else 
			$_t_ErrorText:="The Edit columns for this Function are not defined - "+"please create ITX DBEdit"+$_t_FunctionName+", and optionally ITX DBEdit"+$_t_FunctionName+IME_t_UserInitials
		End if 
		
		IME_CachedDataPut($_t_DefinitionName; 60; "IME_al_DefColPos"; "IME_at_DefData"; "IME_at_DefLabel"; "IME_at_DefSize"; "IME_at_DefRows"; "IME_at_DefMaxSize"; "IME_at_DefAlign"; "IME_at_DefITX"; "IME_at_DefName"; "IME_at_DefJavascript"; "IME_at_DEFREQUIRED")
		
	End if 
	
	//find or create the array element
	//that is used to refer to interProcess_Name selections
	
	$_t_NextDis:="true"  //variables to grey or not the form button
	$_t_PreviousDIS:="true"
	
	If ($_bo_New)
		If ($_bo_ReadWrite)
			CREATE RECORD:C68($_ptr_Table->)  //create a temporary blank record
		Else 
			$_t_ErrorText:="Sorry, you do not have access to create new entries."
		End if 
		$_l_INSResult:=0
	Else 
		$_t_NamedSelection:=Substring:C12("◊"+vWebRef+$_t_FunctionName; 1; 19)
		$_l_INSResult:=IME_ITXListNS($_t_NamedSelection)
		If ($_l_INSResult>=0)
			
			$_bo_First:=($_l_INSResult=1)
			If (($_bo_First) | ($_bo_FirstTime))  //replace previous selection
				COPY NAMED SELECTION:C331($_ptr_Table->; $_t_NamedSelection)
			Else 
				USE NAMED SELECTION:C332($_t_NamedSelection)
			End if 
			
			If ($_l_SelectedRecordNumber>0)
				$_l_RecordsCount:=Records in selection:C76($_ptr_Table->)
				If ($_l_SelectedRecordNumber>$_l_RecordsCount)
					LAST RECORD:C200($_ptr_Table->)
					$_l_SelectedRecordNumber:=$_l_RecordsCount
				Else 
					GOTO SELECTED RECORD:C245($_ptr_Table->; $_l_SelectedRecordNumber)
				End if 
				If ($_l_SelectedRecordNumber>1)
					$_t_PreviousDIS:="false"
				End if 
				If ($_l_SelectedRecordNumber<$_l_RecordsCount)
					$_t_NextDis:="false"
				End if 
			Else 
				$_t_ErrorText:="No record identifier was present.  Please try Find again to create a"+" new list"
			End if 
		Else 
			$_t_ErrorText:="The record could not be found within the list.  Please try Find again to create a"+" new list"
		End if 
	End if 
	
	//*************************
	//draw the page
	//*************************
	
	IME_DBHeader($_t_FunctionTitle; $_t_Direct; $_t_FunctionTitle; $_t_RightHeading; "DBEdit"+$_t_FunctionName; "editStart("+$_t_SaveDIS+","+$_t_NewDIS+","+$_t_DeleteDIS+","+$_t_FindDIS+","+$_t_PreviousDIS+","+$_t_NextDis+");"+$_t_DQ+" onBeforeUnload="+$_t_DQ+"return editEnd();"; "onSubmit="+$_t_DQ+"return editSubmit();"+$_t_DQ)
	
	IME_ReplyText2("ITX DGEditJS")  //generic edit JS
	IME_ReplyText2("ITX DGEditJS"+$_t_FunctionName)  //function-specific JS
	
	//IME_ReplyText2 ("ITX DGButtEdit")
	
	If ($_t_ErrorText#"")
		IME_ReplyText2("ITX DGTextError"; $_t_ErrorText)
	Else 
		
		If ((($_l_INSResult>=0) & ($_l_ColumnCount>0) & ($_l_SelectedRecordNumber>0)) | ($_bo_New))  //we have data and column definitions
			
			IME_ReplyText2("ITX DGEditTable")
			
			For ($_l_ColumnIndex; 1; $_l_ColumnCount)
				
				If (IME_al_DefColPos{$_l_ColumnIndex}<2)
					IME_Reply("<TR>")
				End if 
				If (IME_al_DefColPos{$_l_ColumnIndex}=0)
					$_t_ColumnSpan:=String:C10(($_l_MaxColumnSpan*2)-1)
				Else 
					$_t_ColumnSpan:="1"
				End if 
				
				$_t_Data:=IME_Replace("<*"+IME_at_DefData{$_l_ColumnIndex}+"*>")
				
				If ($_bo_ReadWrite)
					
					$_bo_Handled:=False:C215
					
					Case of 
						: (IME_at_DefITX{$_l_ColumnIndex}="ITX DGEditCheckbox@")
							IME_ReplyText2(IME_at_DefITX{$_l_ColumnIndex}; ("checked"*Num:C11($_t_Data="Yes")); IME_at_DefLabel{$_l_ColumnIndex}; IME_at_DefName{$_l_ColumnIndex}; IME_at_DefSize{$_l_ColumnIndex}; IME_at_DefMaxSize{$_l_ColumnIndex}; IME_at_DefAlign{$_l_ColumnIndex}; IME_at_DefJavascript{$_l_ColumnIndex}; IME_at_DefRows{$_l_ColumnIndex}; $_t_ColumnSpan)
							$_bo_Handled:=True:C214
							
						: ((IME_at_DefITX{$_l_ColumnIndex}="ITX DGEditRadio@") | (IME_at_DefITX{$_l_ColumnIndex}="ITX DGEditPopup@"))
							$_l_SemiColonPosition:=Position:C15(";"; IME_at_DefData{$_l_ColumnIndex})
							If ($_l_SemiColonPosition>0)
								$_t_Format:=Substring:C12(IME_at_DefData{$_l_ColumnIndex}; $_l_SemiColonPosition+1)
								
								If ($_t_Format="List=@")
									
									ARRAY LONGINT:C221($_al_WebListID; 0)
									ARRAY TEXT:C222($_at_WebListData; 0)
									$_l_ListID:=AA_LoadListByName(STR_RemoveLeadTrailSpace(Substring:C12($_t_Format; 6)); ->$_at_WebListData; ->$_al_WebListID)
									
									$_l_ArraySize:=Size of array:C274($_at_WebListData)
									$_t_PopUP:=""
									For ($_l_ElemIndex; 1; $_l_ArraySize)
										If ($_at_WebListData{$_l_ArraySize}=$_t_Data)
											$_t_PopUP:=$_t_PopUP+"<OPTION SELECTED VALUE="+$_t_DQ+$_at_WebListData{$_l_ElemIndex}+$_t_DQ+">"+$_at_WebListData{$_l_ElemIndex}
										Else 
											$_t_PopUP:=$_t_PopUP+"<OPTION VALUE="+$_t_DQ+$_at_WebListData{$_l_ElemIndex}+$_t_DQ+">"+$_at_WebListData{$_l_ElemIndex}
										End if 
									End for 
									IME_ReplyText2(IME_at_DefITX{$_l_ColumnIndex}; IME_at_DefLabel{$_l_ColumnIndex}; IME_at_DefName{$_l_ColumnIndex}; IME_at_DefAlign{$_l_ColumnIndex}; IME_at_DefJavascript{$_l_ColumnIndex}; $_t_PopUP; $_t_ColumnSpan)
									
								Else 
									
									$_l_BarPosition:=Position:C15("|"; $_t_Format)
									If ($_l_BarPosition>0)
										
										ARRAY TEXT:C222($_at_FormatValue; 0)  //max 4 radio buttons in one group
										ARRAY TEXT:C222($_at_FormatShow; 0)  //otherwise will be a popup
										ARRAY TEXT:C222($_at_FormatChecked; 0)
										$_l_FormatCount:=0
										$_l_ArraySize:=0
										$_bo_LastChunk:=False:C215
										
										While ((($_l_BarPosition>0) | ($_bo_LastChunk)) & ($_t_Format#""))
											
											If ($_bo_LastChunk)
												$_t_FormatChunk:=$_t_Format
												$_t_Format:=""
											Else 
												$_t_FormatChunk:=Substring:C12($_t_Format; 1; $_l_BarPosition-1)
												$_t_Format:=Substring:C12($_t_Format; $_l_BarPosition+1)
											End if 
											
											If ($_t_FormatChunk#"")
												
												$_l_ArraySize:=$_l_ArraySize+1
												INSERT IN ARRAY:C227($_at_FormatValue; $_l_ArraySize; 1)
												INSERT IN ARRAY:C227($_at_FormatShow; $_l_ArraySize; 1)
												INSERT IN ARRAY:C227($_at_FormatChecked; $_l_ArraySize; 1)
												
												$_l_SlashPosition:=Position:C15("/"; $_t_FormatChunk)
												If ($_l_SlashPosition>0)
													$_at_FormatValue{$_l_ArraySize}:=Substring:C12($_t_FormatChunk; 1; $_l_SlashPosition-1)
													$_at_FormatShow{$_l_ArraySize}:=Substring:C12($_t_FormatChunk; $_l_SlashPosition+1)
												Else 
													$_at_FormatValue{$_l_ArraySize}:=$_t_FormatChunk
													$_at_FormatShow{$_l_ArraySize}:=$_t_FormatChunk
												End if 
												
												If (($_at_FormatValue{$_l_ArraySize}=$_t_Data) | (($_at_FormatValue{$_l_ArraySize}="True") & ($_t_Data="Yes")) | (($_at_FormatValue{$_l_ArraySize}="False") & ($_t_Data="No")))
													$_at_FormatChecked{$_l_ArraySize}:="checked"
												End if 
												
											End if 
											
											$_l_BarPosition:=Position:C15("|"; $_t_Format)
											If (($_l_BarPosition=0) & ($_bo_LastChunk=False:C215))
												$_bo_LastChunk:=True:C214
											Else 
												$_bo_LastChunk:=False:C215
											End if 
											
										End while 
										
										If (IME_at_DefITX{$_l_ColumnIndex}="ITX DGEditRadio@")
											
											Case of 
												: ($_l_ArraySize=2)
													IME_ReplyText2(IME_at_DefITX{$_l_ColumnIndex}; IME_at_DefLabel{$_l_ColumnIndex}; IME_at_DefName{$_l_ColumnIndex}; IME_at_DefAlign{$_l_ColumnIndex}; IME_at_DefJavascript{$_l_ColumnIndex}; $_t_ColumnSpan; $_at_FormatValue{1}; $_at_FormatShow{1}; $_at_FormatChecked{1}; $_at_FormatValue{2}; $_at_FormatShow{2}; $_at_FormatChecked{2})
												: ($_l_ArraySize=3)
													IME_ReplyText2(IME_at_DefITX{$_l_ColumnIndex}; IME_at_DefLabel{$_l_ColumnIndex}; IME_at_DefName{$_l_ColumnIndex}; IME_at_DefAlign{$_l_ColumnIndex}; IME_at_DefJavascript{$_l_ColumnIndex}; $_t_ColumnSpan; $_at_FormatValue{1}; $_at_FormatShow{1}; $_at_FormatChecked{1}; $_at_FormatValue{2}; $_at_FormatShow{2}; $_at_FormatChecked{2}; $_at_FormatValue{3}; $_at_FormatShow{3}; $_at_FormatChecked{3})
												: ($_l_ArraySize=4)
													IME_ReplyText2(IME_at_DefITX{$_l_ColumnIndex}; IME_at_DefLabel{$_l_ColumnIndex}; IME_at_DefName{$_l_ColumnIndex}; IME_at_DefAlign{$_l_ColumnIndex}; IME_at_DefJavascript{$_l_ColumnIndex}; $_t_ColumnSpan; $_at_FormatValue{1}; $_at_FormatShow{1}; $_at_FormatChecked{1}; $_at_FormatValue{2}; $_at_FormatShow{2}; $_at_FormatChecked{2}; $_at_FormatValue{3}; $_at_FormatShow{3}; $_at_FormatChecked{3}; $_at_FormatValue{4}; $_at_FormatShow{4}; $_at_FormatChecked{4})
											End case 
											
										Else   //popup
											
											$_t_PopUP:=""
											For ($_l_ElemIndex; 1; $_l_ArraySize)
												If ($_at_FormatChecked{$_l_ElemIndex}="checked")
													$_t_PopUP:=$_t_PopUP+"<OPTION SELECTED VALUE="+$_t_DQ+$_at_FormatValue{$_l_ElemIndex}+$_t_DQ+">"+$_at_FormatShow{$_l_ElemIndex}
												Else 
													$_t_PopUP:=$_t_PopUP+"<OPTION VALUE="+$_t_DQ+$_at_FormatValue{$_l_ElemIndex}+$_t_DQ+">"+$_at_FormatShow{$_l_ElemIndex}
												End if 
											End for 
											IME_ReplyText2(IME_at_DefITX{$_l_ColumnIndex}; IME_at_DefLabel{$_l_ColumnIndex}; IME_at_DefName{$_l_ColumnIndex}; IME_at_DefAlign{$_l_ColumnIndex}; IME_at_DefJavascript{$_l_ColumnIndex}; $_t_PopUP; $_t_ColumnSpan)
											
										End if 
										$_bo_Handled:=True:C214
									End if 
									
								End if 
								
							End if 
							
						: (IME_at_DefData{$_l_ColumnIndex}="@;Lookup=@")
							
							If (Is nil pointer:C315(IME_aptr_DefField{$_l_ColumnIndex}))
								$_l_SemiColonPosition:=Position:C15(";"; IME_at_DefData{$_l_ColumnIndex})
								If ($_l_SemiColonPosition>0)
									IME_aptr_DefField{$_l_ColumnIndex}:=UTI_FieldPointerFromString(Substring:C12(IME_at_DefData{$_l_ColumnIndex}; 1; $_l_SemiColonPosition-1))
								Else 
									IME_aptr_DefField{$_l_ColumnIndex}:=UTI_FieldPointerFromString(IME_at_DefData{$_l_ColumnIndex})
								End if 
							End if 
							If (Not:C34(Is nil pointer:C315(IME_aptr_DefField{$_l_ColumnIndex})))
								$_t_RelatedValue:=IME_DBLookupQuery(IME_at_DefData{$_l_ColumnIndex}; IME_aptr_DefField{$_l_ColumnIndex})
								//IME_ReplyText2 (IME_at_DefITX{$_l_ColumnIndex};ITK_Text2HTML ($_t_Data);IME_at_DefLabel{$_l_ColumnIndex};IME_at_DefName{$_l_ColumnIndex};IME_at_DefSize{$_l_ColumnIndex};IME_at_DefMaxSize{$_l_ColumnIndex};IME_at_DefAlign{$_l_ColumnIndex};IME_at_DefJavascript{$_l_ColumnIndex};IME_at_DefRows{$_l_ColumnIndex};$_t_ColumnSpan;$_t_RelatedValue)
								IME_ReplyText2(IME_at_DefITX{$_l_ColumnIndex}; IME_Text2HTML($_t_Data); IME_at_DefLabel{$_l_ColumnIndex}; IME_at_DefName{$_l_ColumnIndex}; IME_at_DefSize{$_l_ColumnIndex}; IME_at_DefMaxSize{$_l_ColumnIndex}; IME_at_DefAlign{$_l_ColumnIndex}; IME_at_DefJavascript{$_l_ColumnIndex}; IME_at_DefRows{$_l_ColumnIndex}; $_t_ColumnSpan; $_t_RelatedValue)  //removed  ITK_Text2HTML 14/02/08
								$_bo_Handled:=True:C214
							End if 
							
					End case 
					
					If ($_bo_Handled=False:C215)  //standard for alpha, textarea, normal inputs etc
						//IME_ReplyText2 (IME_at_DefITX{$_l_ColumnIndex};ITK_Text2HTML ($_t_Data);IME_at_DefLabel{$_l_ColumnIndex};IME_at_DefName{$_l_ColumnIndex};IME_at_DefSize{$_l_ColumnIndex};IME_at_DefMaxSize{$_l_ColumnIndex};IME_at_DefAlign{$_l_ColumnIndex};IME_at_DefJavascript{$_l_ColumnIndex};IME_at_DefRows{$_l_ColumnIndex};$_t_ColumnSpan)
						IME_ReplyText2(IME_at_DefITX{$_l_ColumnIndex}; IME_Text2HTML($_t_Data); IME_at_DefLabel{$_l_ColumnIndex}; IME_at_DefName{$_l_ColumnIndex}; IME_at_DefSize{$_l_ColumnIndex}; IME_at_DefMaxSize{$_l_ColumnIndex}; IME_at_DefAlign{$_l_ColumnIndex}; IME_at_DefJavascript{$_l_ColumnIndex}; IME_at_DefRows{$_l_ColumnIndex}; $_t_ColumnSpan)  //removed  ITK_Text2HTML 14/02/08
					End if 
					
				Else 
					$_t_ITX:=IME_at_DefITX{$_l_ColumnIndex}+"RO"
					$_l_ScriptRow:=Find in field:C653([SCRIPTS:80]Script_Code:1; $_t_ITX)
					If ($_l_ScriptRow>0)
						IME_ReplyText2($_t_ITX; $_t_Data; IME_at_DefLabel{$_l_ColumnIndex}; IME_at_DefAlign{$_l_ColumnIndex}; $_t_ColumnSpan)
					Else 
						IME_ReplyText2("ITX DGEditRO"; $_t_Data; IME_at_DefLabel{$_l_ColumnIndex}; IME_at_DefAlign{$_l_ColumnIndex}; $_t_ColumnSpan)
					End if 
				End if 
				
				If ((IME_al_DefColPos{$_l_ColumnIndex}=0) | (IME_al_DefColPos{$_l_ColumnIndex}=$_l_MaxColumnSpan) | ($_l_ColumnIndex=$_l_ColumnCount))
					IME_Reply("</TR>")
				Else 
					If (IME_al_DefColPos{$_l_ColumnIndex+1}<=IME_al_DefColPos{$_l_ColumnIndex})
						IME_Reply("</TR>")
					End if 
				End if 
				
			End for 
			
			IME_ReplyText2("ITX DGEditTable/")
			
		End if 
		
	End if 
	
	IME_ReplyText2("ITX DGListHidden"; String:C10($_l_Page); String:C10($_l_Number); $_t_Sort)
	IME_ReplyText2("ITX DGEditHidden"; String:C10(Num:C11($_bo_ReadWrite)))
	
	IME_ReplyText2("ITX DGButtEdit")
	
	IME_DBFooter
	
	UNLOAD RECORD:C212($_ptr_Table->)
	
End if 
ERR_MethodTrackerReturn("IME_DBEdit"; $_t_oldMethodName)