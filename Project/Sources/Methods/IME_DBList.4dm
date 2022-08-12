//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_DBList
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
	ARRAY TEXT:C222($_at_SortColumns; 0)
	ARRAY TEXT:C222($_at_SortDIrections; 0)
	//ARRAY TEXT(IME_at_DefAlign;0)
	//ARRAY TEXT(IME_at_DefData;0)
	//ARRAY TEXT(IME_at_DefEditLink;0)
	//ARRAY TEXT(IME_at_DefITX;0)
	//ARRAY TEXT(IME_at_DefLabel;0)
	//ARRAY TEXT(IME_at_DefSize;0)
	//ARRAY TEXT(IME_at_DefSortable;0)
	//ARRAY TEXT(IME_at_DefSortPosition;0)
	//ARRAY TEXT(IME_at_DefTotal;0)
	C_BOOLEAN:C305($_bo_AreTotals; $_bo_Draw; $_bo_First; $_bo_Firsttime)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_ColumnsCount; $_l_ColumnsIndex; $_l_CountData; $_l_CRPosition; $_l_CurrentProcess; $_l_CurrentRow; $_l_DataPosition; $_l_FieldNumber; $_l_FieldType; $_l_From)
	C_LONGINT:C283($_l_INSResult; $_l_Max; $_l_Number; $_l_Number2; $_l_Page; $_l_Pages; $_l_SemiColonPosition; $_l_Shown; $_l_SortCount; $_l_SortedColumn; $_l_SortIndex)
	C_LONGINT:C283($_l_SortInsertedAt; $_l_SortPosition; $_l_TableNumber; $_l_To; vC)
	C_POINTER:C301($_ptr_Field; $_Ptr_OrderBy; $_Ptr_Table)
	C_REAL:C285($_r_Average; $_r_Sum)
	C_TEXT:C284(<>GEN_t_OK; <>STR_t_CR; $_t_Chunk; $_t_Command; $_t_CR; $_t_Data; $_t_DefinitionName; $_t_Direct; $_t_EditLink; $_t_ErrorText; $_t_Find)
	C_TEXT:C284($_t_Format; $_t_FromPage; $_t_FunctionName; $_t_FunctionTitle; $_t_LastSortDirection; $_t_ListDefinition; $_t_NamedSelection; $_t_OddEven; $_t_oldMethodName; $_t_PagingHTML; $_t_Result)
	C_TEXT:C284($_t_RightHeading; $_t_SelectedRecordNumber; $_t_Sort; $_t_SortColumn; $_t_SortDirection; $_t_Submit; $_t_TotalText; $1; IME_t_UserGroupCode; IME_t_UserInitials; vWebRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_DBList")
//IME_DBList
//Rollo 11/6/2004

//Draw a list page for any table supported in the generic interface


$_t_Direct:=$1  //the page url
$_t_FunctionName:=Substring:C12($_t_Direct; 7; 15)  //eg DBEditCompanies -> Companies, max length 21

$_t_Submit:=IME_FieldValue("submit")
$_t_FromPage:=IME_FieldValue("frompage")

$_l_Page:=Num:C11(IME_Parameter("Page"))
$_t_Sort:=IME_Parameter("Sort")
$_t_Command:=IME_Parameter("Cmd")  //Command
$_t_LastSortDirection:=IME_Parameter("Direction")
If ($_t_LastSortDirection="1")
	$_t_LastSortDirection:=">"
Else 
	$_t_LastSortDirection:="<"
End if 
$_l_SortedColumn:=Num:C11(IME_Parameter("SortedColumn"))  //remember the sorted column for Next/Prev etc

$_t_FunctionTitle:=Uppers3(Lowercase:C14($_t_FunctionName))  //by default use the url name
$_t_ErrorText:=""
$_t_CR:=<>STR_t_CR
$_t_SortDirection:=">"
$_bo_AreTotals:=False:C215
$_l_CurrentProcess:=Current process:C322

$_l_Max:=50

$_bo_Draw:=True:C214

Case of 
		
	: ($_t_Submit="New")  //clicked the New button
		IME_DBEdit("DBEdit"+$_t_FunctionName)
		$_bo_Draw:=False:C215
		
	: (($_t_Submit="Find") & ($_t_FromPage="List"))  //clicked the Find button
		IME_DBFind("DBFind"+$_t_FunctionName)
		$_bo_Draw:=False:C215
		
End case 


If ($_bo_Draw)
	
	Case of 
			
		: ($_t_FunctionName="Companies@")
			$_Ptr_Table:=->[COMPANIES:2]
			$_Ptr_OrderBy:=->[COMPANIES:2]Company_Name:2  //default sort only - may be overridden by DBList definitions
			
		: ($_t_FunctionName="Contacts@")
			$_Ptr_Table:=->[CONTACTS:1]
			$_Ptr_OrderBy:=->[CONTACTS:1]Surname:5
			
		: ($_t_FunctionName="Products@")
			$_Ptr_Table:=->[PRODUCTS:9]
			$_Ptr_OrderBy:=->[PRODUCTS:9]Product_Code:1
			
		: ($_t_FunctionName="Orders@")
			$_Ptr_Table:=->[ORDERS:24]
			$_Ptr_OrderBy:=->[ORDERS:24]Order_Code:3
			
		: ($_t_FunctionName="Diary@")
			$_Ptr_Table:=->[DIARY:12]
			$_Ptr_OrderBy:=->[DIARY:12]Date_Do_From:4
			
		: ($_t_FunctionName="ServiceCalls@")
			$_Ptr_Table:=->[SERVICE_CALLS:20]
			$_Ptr_OrderBy:=->[SERVICE_CALLS:20]Company_Code:1
			$_t_FunctionTitle:="Service Calls"
			
			//*************************** added the following searches 26/04/07 -kmw **************************
		: ($_t_FunctionName="JobStagePer@")
			$_Ptr_Table:=->[JOB PERSONNEL:48]
			$_Ptr_OrderBy:=->[JOB PERSONNEL:48]Job_Personnel_Code:18
			$_t_FunctionTitle:="Job Stage Personnel"
			
		: ($_t_FunctionName="JobStage@")
			$_Ptr_Table:=->[JOB_STAGES:47]
			$_Ptr_OrderBy:=->[JOB_STAGES:47]Job_Stage_code:52
			$_t_FunctionTitle:="Job Stages"
			
		: ($_t_FunctionName="Job@")
			$_Ptr_Table:=->[JOBS:26]
			$_Ptr_OrderBy:=->[JOBS:26]Job_Code:1
			$_t_FunctionTitle:="Jobs"
			
		: ($_t_FunctionName="Project@")
			$_Ptr_Table:=->[PROJECTS:89]
			$_Ptr_OrderBy:=->[PROJECTS:89]Project_Code:1
			$_t_FunctionTitle:="Projects"
			//************************************************************************************
			
		Else 
			
			$_t_FunctionTitle:="Nothing"
			$_l_Number:=0
			$_t_Find:=""
			$_Ptr_Table:=->[COMPANIES:2]
			$_Ptr_OrderBy:=->[COMPANIES:2]Company_Name:2
			
	End case 
	
	//DEFAULT TABLE($_Ptr_Table->)
	
	If ($_l_Page=0)  //first time- just arrived from a Find
		
		$_l_Number:=Records in selection:C76
		$_bo_Firsttime:=True:C214
		$_l_Page:=1
		$_t_Sort:=""
		
	Else 
		
		$_l_Number:=Num:C11(IME_Parameter("No"))
		$_bo_Firsttime:=False:C215
		
	End if 
	
	
	//calc the pages
	$_l_From:=(($_l_Page-1)*$_l_Max)+1
	$_l_To:=$_l_Page*$_l_Max
	If ($_l_To>$_l_Number)
		$_l_To:=$_l_Number
	End if 
	$_l_Shown:=$_l_To-$_l_From+1
	$_l_Number2:=$_l_From+$_l_Shown
	$_l_Pages:=Int:C8($_l_Number/$_l_Max)
	$_l_Pages:=$_l_Pages+Num:C11($_l_Pages#($_l_Number/$_l_Max))  //add one if not exact
	
	
	//get the text that defines the columns - eg ITX DBListCompanies (or with Initials on the end)
	$_t_DefinitionName:="List"+$_t_FunctionName+IME_t_UserInitials
	$_t_ListDefinition:=IME_Text2("ITX DB"+$_t_DefinitionName)  //specific to the Person
	If ($_t_ListDefinition#"@data=@")
		$_t_DefinitionName:="List"+$_t_FunctionName+"_"+IME_t_UserGroupCode
		$_t_ListDefinition:=IME_Text2("ITX DB"+$_t_DefinitionName)  //specific to the Peronnel Group
		If ($_t_ListDefinition#"@data=@")
			$_t_DefinitionName:="List"+$_t_FunctionName
			$_t_ListDefinition:=IME_Text2("ITX DB"+$_t_DefinitionName)  //the default for this table"
		End if 
	End if 
	If ($_t_ListDefinition="")
		$_t_ListDefinition:=IME_DBListDefCreate($_t_FunctionName; $_Ptr_Table; $_Ptr_OrderBy)
	End if 
	
	//silly repetition of below, but required uncomp
	ARRAY TEXT:C222(IME_at_DefData; 0)
	ARRAY TEXT:C222(IME_at_DefLabel; 0)
	ARRAY TEXT:C222(IME_at_DefSize; 0)
	ARRAY TEXT:C222(IME_at_DefSortPosition; 0)
	ARRAY TEXT:C222(IME_at_DefSortable; 0)
	ARRAY TEXT:C222(IME_at_DefEditLink; 0)
	ARRAY TEXT:C222(IME_at_DefAlign; 0)
	ARRAY TEXT:C222(IME_at_DefITX; 0)
	ARRAY TEXT:C222(IME_at_DefTotal; 0)
	
	//retrieve the processed arrays from a cache
	$_t_Result:=IME_CachedDataGet($_t_DefinitionName; "IME_at_DefData"; "IME_at_DefLabel"; "IME_at_DefSize"; "IME_at_DefSortPosition"; "IME_at_DefSortable"; "IME_at_DefEditLink"; "IME_at_DefAlign"; "IME_at_DefITX"; "IME_at_DefTotal")
	
	If ($_t_Result=<>GEN_t_OK)  //if found in cache
		
		$_l_ColumnsCount:=(Size of array:C274(IME_at_DefData))
		If ($_l_ColumnsCount=0)
			$_t_ErrorText:="The columns for this Function are not defined - "+"please create ITX DBList"+$_t_FunctionName+", and optionally ITX DBList"+$_t_FunctionName+IME_t_UserInitials
		End if 
		
	Else   //if not, produce them
		
		//arrays for the list definitions
		$_l_CountData:=STR_CountStr($_t_ListDefinition; "data=")
		ARRAY TEXT:C222(IME_at_DefData; $_l_CountData)
		ARRAY TEXT:C222(IME_at_DefLabel; $_l_CountData)
		ARRAY TEXT:C222(IME_at_DefSize; $_l_CountData)
		ARRAY TEXT:C222(IME_at_DefSortPosition; $_l_CountData)
		ARRAY TEXT:C222(IME_at_DefSortable; $_l_CountData)
		ARRAY TEXT:C222(IME_at_DefEditLink; $_l_CountData)
		ARRAY TEXT:C222(IME_at_DefAlign; $_l_CountData)
		ARRAY TEXT:C222(IME_at_DefITX; $_l_CountData)
		ARRAY TEXT:C222(IME_at_DefTotal; $_l_CountData)
		
		//interpret the list definitions
		$_l_DataPosition:=Position:C15("data="; $_t_ListDefinition)
		$_l_ColumnsCount:=0
		
		If ($_l_DataPosition>0)  //all list definitions must have at least one of these
			
			$_t_ListDefinition:=Substring:C12($_t_ListDefinition; $_l_DataPosition)  //remove any leading CRs etc
			$_t_ListDefinition:=$_t_ListDefinition+$_t_CR  //just to ensure there's one at the end
			
			While ($_l_DataPosition>0)
				
				$_l_CRPosition:=Position:C15($_t_CR; $_t_ListDefinition)
				$_t_Data:=Substring:C12($_t_ListDefinition; 6; $_l_CRPosition-6)
				$_t_ListDefinition:=Substring:C12($_t_ListDefinition; $_l_CRPosition+1)
				$_l_DataPosition:=Position:C15("Data="; $_t_ListDefinition)
				If ($_l_DataPosition>0)
					$_t_Chunk:=Substring:C12($_t_ListDefinition; 1; $_l_DataPosition-1)
					$_t_ListDefinition:=Substring:C12($_t_ListDefinition; $_l_DataPosition)
				Else 
					$_t_Chunk:=$_t_ListDefinition
					$_t_ListDefinition:=""
				End if 
				
				If ($_t_Data#"")
					
					If ($_l_ColumnsCount<$_l_CountData)
						$_l_ColumnsCount:=$_l_ColumnsCount+1
						$_l_ColumnsIndex:=$_l_ColumnsCount  //copied for clarity of lines below
						
						//read the column definitions & set defaults
						IME_at_DefData{$_l_ColumnsIndex}:=STR_RemoveLeadTrailSpace($_t_Data)
						IME_at_DefLabel{$_l_ColumnsIndex}:=Substring:C12(IME_DBListDefinitionFind("Label"; $_t_Chunk); 1; 79)
						If (IME_at_DefLabel{$_l_ColumnsIndex}="")
							IME_at_DefLabel{$_l_ColumnsIndex}:="&nbsp;"  //allowed a blank label, but want something to fill the TD
						Else 
							IME_at_DefLabel{$_l_ColumnsIndex}:=Replace string:C233(IME_at_DefLabel{$_l_ColumnsIndex}; " "; "&nbsp;")  //non-breaking space
						End if 
						IME_at_DefSize{$_l_ColumnsIndex}:=Substring:C12(IME_DBListDefinitionFind("Width"; $_t_Chunk); 1; 11)
						If (IME_at_DefSize{$_l_ColumnsIndex}="")
							IME_at_DefSize{$_l_ColumnsIndex}:="80"
						End if 
						IME_at_DefSortable{$_l_ColumnsIndex}:=Substring:C12(IME_DBListDefinitionFind("Sortable"; $_t_Chunk); 1; 11)
						If (IME_at_DefSortable{$_l_ColumnsIndex}="")
							IME_at_DefSortable{$_l_ColumnsIndex}:="No"
						End if 
						IME_at_DefSortPosition{$_l_ColumnsIndex}:=Substring:C12(IME_DBListDefinitionFind("Sort position"; $_t_Chunk); 1; 11)
						Case of 
							: (IME_at_DefSortPosition{$_l_ColumnsIndex}="")
								IME_at_DefSortPosition{$_l_ColumnsIndex}:="0"
							: (IME_at_DefData{$_l_ColumnsIndex}#"[@")  //only allow sorts on actual [TABLE]Field Names
								IME_at_DefSortPosition{$_l_ColumnsIndex}:="0"
							: (IME_at_DefSortable{$_l_ColumnsIndex}#"y@")  //must define sortable if you want a default sort
								IME_at_DefSortPosition{$_l_ColumnsIndex}:="0"
							Else 
								If ((IME_at_DefSortPosition{$_l_ColumnsIndex}="1@") & ($_l_SortedColumn=0))
									$_l_SortedColumn:=$_l_ColumnsIndex
								End if 
						End case 
						IME_at_DefEditLink{$_l_ColumnsIndex}:=Substring:C12(IME_DBListDefinitionFind("Edit Link"; $_t_Chunk); 1; 11)
						If (IME_at_DefEditLink{$_l_ColumnsIndex}="")
							IME_at_DefEditLink{$_l_ColumnsIndex}:="No"
						End if 
						IME_at_DefAlign{$_l_ColumnsIndex}:=Substring:C12(IME_DBListDefinitionFind("Align"; $_t_Chunk); 1; 11)
						If (IME_at_DefAlign{$_l_ColumnsIndex}="")
							IME_at_DefAlign{$_l_ColumnsIndex}:="Left"
						End if 
						IME_at_DefITX{$_l_ColumnsIndex}:=Substring:C12(IME_DBListDefinitionFind("ITX"; $_t_Chunk); 1; 31)
						Case of 
							: (IME_at_DefITX{$_l_ColumnsIndex}="")
								IME_at_DefITX{$_l_ColumnsIndex}:="ITX DGList"
							: (IME_at_DefITX{$_l_ColumnsIndex}#"ITX @")
								IME_at_DefITX{$_l_ColumnsIndex}:="ITX "+IME_at_DefITX{$_l_ColumnsIndex}
						End case 
						IME_at_DefTotal{$_l_ColumnsIndex}:=Substring:C12(IME_DBListDefinitionFind("Total"; $_t_Chunk); 1; 31)
						If (IME_at_DefTotal{$_l_ColumnsIndex}#"")
							$_bo_AreTotals:=True:C214
						End if 
					End if 
					
				End if 
				
			End while 
			
		Else 
			$_t_ErrorText:="The columns for this Function are not defined - "+"please create ITX DBList"+$_t_FunctionName+", and optionally ITX DBList"+$_t_FunctionName+IME_t_UserInitials
		End if 
		
		IME_CachedDataPut($_t_DefinitionName; 60; "IME_at_DefData"; "IME_at_DefLabel"; "IME_at_DefSize"; "IME_at_DefSortPosition"; "IME_at_DefSortable"; "IME_at_DefEditLink"; "IME_at_DefAlign"; "IME_at_DefITX"; "IME_at_DefTotal")
		
	End if 
	
	
	//find or create the array element
	//that is used to refer to interProcess_Name selections
	$_t_NamedSelection:=Substring:C12("◊"+vWebRef+$_t_FunctionName; 1; 19)
	$_l_INSResult:=IME_ITXListNS($_t_NamedSelection)
	
	//do the initial sort after a find
	If ($_bo_Firsttime)
		ARRAY TEXT:C222($_at_SortColumns; 0)  //array to store the columns to be sorted
		ARRAY TEXT:C222($_at_SortDIrections; 0)
		$_l_SortCount:=0
		
		For ($_l_ColumnsIndex; 1; $_l_ColumnsCount)
			If (IME_at_DefSortPosition{$_l_ColumnsIndex}#"0")  //find the ones that have a sort position
				$_l_SortPosition:=Num:C11(Substring:C12(IME_at_DefSortPosition{$_l_ColumnsIndex}; 1; 1))  //note that you're only allowed up to 9 sort positions by this, and only 3 are actually used at present
				$_t_SortDirection:=Substring:C12(IME_at_DefSortPosition{$_l_ColumnsIndex}; 2; 1)
				If ($_t_SortDirection#"<")  //ensure it can only be > or <
					$_t_SortDirection:=">"  //default to forwards
				End if 
				
				If ($_l_SortPosition>0)
					$_l_SortCount:=$_l_SortCount+1
					INSERT IN ARRAY:C227($_at_SortColumns; $_l_SortPosition; 1)  //will insert at the first available position, really, or normally if in order
					INSERT IN ARRAY:C227($_at_SortDIrections; $_l_SortPosition; 1)
					For ($_l_SortIndex; 1; $_l_SortCount)  //have to find out where it actually inserted
						If ($_at_SortColumns{$_l_SortIndex}="")
							$_l_SortInsertedAt:=$_l_SortIndex
							$_l_SortIndex:=$_l_SortCount+1
						End if 
					End for 
					If ($_l_SortInsertedAt>0)  //should be an unnecessary test
						$_l_SemiColonPosition:=Position:C15(";"; IME_at_DefData{$_l_ColumnsIndex})
						If ($_l_SemiColonPosition>0)  //remove any format
							$_at_SortColumns{$_l_SortInsertedAt}:=Substring:C12(Substring:C12(IME_at_DefData{$_l_ColumnsIndex}; 1; $_l_SemiColonPosition-1); 1; 79)
						Else 
							$_at_SortColumns{$_l_SortInsertedAt}:=Substring:C12(IME_at_DefData{$_l_ColumnsIndex}; 1; 79)
						End if 
						$_at_SortDIrections{$_l_SortInsertedAt}:=$_t_SortDirection
					End if 
				End if 
			End if 
		End for 
		
		If ($_l_SortCount>0)  //if any were defined in the DBList definitions
			If ($_l_SortCount=1)
				$_l_ColumnsIndex:=1
				$_Ptr_OrderBy:=UTI_FieldPointerFromString($_at_SortColumns{$_l_ColumnsIndex})
				If (Not:C34(Is nil pointer:C315($_Ptr_OrderBy)))
					If ($_at_SortDIrections{$_l_ColumnsIndex}=">")
						ORDER BY:C49($_Ptr_Table->; ($_Ptr_OrderBy)->; >)
					Else 
						ORDER BY:C49($_Ptr_Table->; ($_Ptr_OrderBy)->; <)
						$_t_SortDirection:="<"
					End if 
				End if 
			Else 
				For ($_l_ColumnsIndex; 1; $_l_SortCount)
					$_Ptr_OrderBy:=UTI_FieldPointerFromString($_at_SortColumns{$_l_ColumnsIndex})
					If (Not:C34(Is nil pointer:C315($_Ptr_OrderBy)))
						If ($_at_SortDIrections{$_l_ColumnsIndex}=">")
							ORDER BY:C49($_Ptr_Table->; ($_Ptr_OrderBy)->; >; *)
						Else 
							ORDER BY:C49($_Ptr_Table->; ($_Ptr_OrderBy)->; <; *)
							If ($_l_ColumnsIndex=1)
								$_t_SortDirection:="<"
							End if 
						End if 
					End if 
				End for 
				ORDER BY:C49($_Ptr_Table->)
			End if 
		Else 
			ORDER BY:C49($_Ptr_Table->; ($_Ptr_OrderBy)->; >)  //use the default set above
		End if 
		
	Else   //not a new query
		
		If (($_t_Command="Sort") & ($_t_Sort#"") & ($_l_INSResult>=0))  //new sort request
			USE NAMED SELECTION:C332($_t_NamedSelection)
			$_l_ColumnsIndex:=Num:C11($_t_Sort)
			If (($_l_ColumnsIndex>0) & ($_l_ColumnsIndex<=$_l_ColumnsCount))  //valid column
				If (IME_at_DefSortable{$_l_ColumnsIndex}="y@")  //is sortable
					
					$_l_SemiColonPosition:=Position:C15(";"; IME_at_DefData{$_l_ColumnsIndex})
					If ($_l_SemiColonPosition>0)  //remove any format
						$_t_SortColumn:=Substring:C12(Substring:C12(IME_at_DefData{$_l_ColumnsIndex}; 1; $_l_SemiColonPosition-1); 1; 79)
					Else 
						$_t_SortColumn:=Substring:C12(IME_at_DefData{$_l_ColumnsIndex}; 1; 79)
					End if 
					
					If ($_t_SortColumn#"")
						$_Ptr_OrderBy:=UTI_FieldPointerFromString($_t_SortColumn)
						If (Not:C34(Is nil pointer:C315($_Ptr_OrderBy)))
							If ($_t_LastSortDirection=">")
								ORDER BY:C49($_Ptr_Table->; ($_Ptr_OrderBy)->; <)
								$_t_SortDirection:="<"
							Else 
								ORDER BY:C49($_Ptr_Table->; ($_Ptr_OrderBy)->; >)
							End if 
							$_l_SortedColumn:=$_l_ColumnsIndex
							$_bo_Firsttime:=True:C214  //force the named selection to be copied again below
						End if 
					End if 
					
				End if 
			End if 
		End if 
		
	End if 
	
	//right-hand heading and html for paging links etc
	If ($_l_Pages=1)
		$_t_RightHeading:="Found "+String:C10($_l_Number)
		$_t_PagingHTML:=""
	Else 
		$_t_RightHeading:="Page "+String:C10($_l_Page)+" of "+String:C10($_l_Pages)+" - Found "+String:C10($_l_Number)
		$_t_PagingHTML:="<TR><TD SPAN CLASS=td-listpaging COLSPAN=99>"
		
		If ($_l_Page=1)
			$_t_PagingHTML:=$_t_PagingHTML+"<SPAN CLASS=font-listpaging>&lt;&lt;&nbsp;First&nbsp;"+"&lt;&nbsp;Previous</SPAN>&nbsp;"
		Else 
			$_t_PagingHTML:=$_t_PagingHTML+"<SPAN CLASS=font-listpaging>&lt;&lt;&nbsp;</SPAN>"+"<A HREF="+IME_DBEncrypt("DBList"+$_t_FunctionName+"?Page=1&Sort="+$_t_Sort+"&No="+String:C10($_l_Number)+"&sortedcolumn="+String:C10($_l_SortedColumn))+"><SPAN CLASS=font-listpaginglink>First</SPAN></A>&nbsp;"
			$_t_PagingHTML:=$_t_PagingHTML+"<SPAN CLASS=font-listpaging>&lt;&nbsp;</SPAN>"+"<A HREF="+IME_DBEncrypt("DBList"+$_t_FunctionName+"?Page="+String:C10($_l_Page-1)+"&Sort="+$_t_Sort+"&No="+String:C10($_l_Number)+"&sortedcolumn="+String:C10($_l_SortedColumn))+"><SPAN CLASS=font-listpaginglink>Previous</SPAN></A>&nbsp;"
		End if 
		
		If ($_l_Page=$_l_Pages)
			$_t_PagingHTML:=$_t_PagingHTML+"<SPAN CLASS=font-listpaging>-&nbsp;Next&nbsp;&gt;&nbsp;"+"Last&nbsp;&gt;&gt;</SPAN>&nbsp;"
		Else 
			$_t_PagingHTML:=$_t_PagingHTML+"<SPAN CLASS=font-listpaging>-</SPAN>&nbsp;"
			$_t_PagingHTML:=$_t_PagingHTML+"<A HREF="+IME_DBEncrypt("DBList"+$_t_FunctionName+"?Page="+String:C10($_l_Page+1)+"&Sort="+$_t_Sort+"&No="+String:C10($_l_Number)+"&sortedcolumn="+String:C10($_l_SortedColumn))+"><SPAN CLASS=font-listpaginglink>Next</SPAN></A>"+"<SPAN CLASS=font-listpaging>&nbsp;&gt;</SPAN>&nbsp;"
			$_t_PagingHTML:=$_t_PagingHTML+"<A HREF="+IME_DBEncrypt("DBList"+$_t_FunctionName+"?Page="+String:C10($_l_Pages)+"&Sort="+$_t_Sort+"&No="+String:C10($_l_Number)+"&sortedcolumn="+String:C10($_l_SortedColumn))+"><SPAN CLASS=font-listpaginglink>Last</SPAN></A>"+"<SPAN CLASS=font-listpaging>&nbsp;&gt;&gt;</SPAN>&nbsp;"
		End if 
		
		$_t_PagingHTML:=$_t_PagingHTML+"</TD></TR>"
	End if 
	
	
	//*************************
	//draw the page
	//*************************
	
	IME_DBHeader("View "+$_t_FunctionTitle; $_t_Direct; "View "+$_t_FunctionTitle; $_t_RightHeading; "DBList"+$_t_FunctionName)
	
	If ($_t_ErrorText#"")
		IME_ReplyText2("ITX DGTextError"; $_t_ErrorText)
	End if 
	
	If ($_l_ColumnsCount>0)  //we have column definitions
		
		IME_ReplyText2("ITX DGListTable")
		
		If ($_t_PagingHTML#"")
			IME_Reply($_t_PagingHTML)
		End if 
		
		//draw the headings
		IME_Reply("<TR>")
		IME_ReplyText2("ITX DGListHeadSelect"; String:C10($_l_To-$_l_From+1))
		
		For ($_l_ColumnsIndex; 1; $_l_ColumnsCount)
			Case of 
				: ($_l_ColumnsIndex=$_l_SortedColumn)
					IME_ReplyText2("ITX DGListHeadSorted"; IME_at_DefLabel{$_l_ColumnsIndex}; IME_at_DefSize{$_l_ColumnsIndex}; IME_at_DefAlign{$_l_ColumnsIndex}; IME_DBEncrypt("DBList"+$_t_FunctionName+"?cmd=sort&sort="+String:C10($_l_ColumnsIndex)+"&direction="+String:C10(Num:C11($_t_SortDirection=">"))+"&page="+String:C10($_l_Page)+"&no="+String:C10($_l_Number)))
				: (IME_at_DefSortable{$_l_ColumnsIndex}="y@")
					IME_ReplyText2("ITX DGListHeadLink"; IME_at_DefLabel{$_l_ColumnsIndex}; IME_at_DefSize{$_l_ColumnsIndex}; IME_at_DefAlign{$_l_ColumnsIndex}; IME_DBEncrypt("DBList"+$_t_FunctionName+"?cmd=sort&sort="+String:C10($_l_ColumnsIndex)+"&page="+String:C10($_l_Page)+"&no="+String:C10($_l_Number)))
				Else 
					IME_ReplyText2("ITX DGListHead"; IME_at_DefLabel{$_l_ColumnsIndex}; IME_at_DefSize{$_l_ColumnsIndex}; IME_at_DefAlign{$_l_ColumnsIndex})
			End case 
		End for 
		IME_Reply("</TR>")
		
		//draw the list
		If ($_l_INSResult>=0)
			$_bo_First:=($_l_INSResult=1)
			
			If (($_bo_First) | ($_bo_Firsttime))  //replace previous selection
				COPY NAMED SELECTION:C331($_Ptr_Table->; $_t_NamedSelection)
			Else 
				USE NAMED SELECTION:C332($_t_NamedSelection)
			End if 
			
			$_l_CurrentRow:=$_l_From
			GOTO SELECTED RECORD:C245($_Ptr_Table->; $_l_CurrentRow)
			vC:=1  //a process count variable that can be used in the ITXs if needed
			
			While ((Not:C34(End selection:C36($_Ptr_Table->))) & ($_l_CurrentRow<=$_l_To) & (<>SYS_l_CancelProcess#$_l_CurrentProcess))
				
				If (Int:C8($_l_CurrentRow/2)=($_l_CurrentRow/2))
					$_t_OddEven:="even"  //used to append to the td style class name
				Else 
					$_t_OddEven:="odd"
				End if 
				
				IME_Reply("<TR>")
				
				$_t_SelectedRecordNumber:=String:C10(Selected record number:C246($_Ptr_Table->))
				$_t_EditLink:=IME_DBEncrypt("DBEdit"+$_t_FunctionName+"?item="+$_t_SelectedRecordNumber+"&page="+String:C10($_l_Page)+"&sort="+$_t_Sort+"&no="+String:C10($_l_Number)+"&sortedcolumn="+String:C10($_l_SortedColumn))
				
				IME_ReplyText2("ITX DGListSelect"; $_t_OddEven; String:C10(vC); $_t_SelectedRecordNumber)
				
				For ($_l_ColumnsIndex; 1; $_l_ColumnsCount)
					
					$_t_Data:=IME_Replace("<*"+IME_at_DefData{$_l_ColumnsIndex}+"*>")
					
					If (IME_at_DefEditLink{$_l_ColumnsIndex}="y@")
						IME_ReplyText2(IME_at_DefITX{$_l_ColumnsIndex}+"Link"; $_t_Data; $_t_OddEven; IME_at_DefAlign{$_l_ColumnsIndex}; String:C10(vC); $_t_SelectedRecordNumber; $_t_EditLink)
					Else 
						IME_ReplyText2(IME_at_DefITX{$_l_ColumnsIndex}; $_t_Data; $_t_OddEven; IME_at_DefAlign{$_l_ColumnsIndex}; String:C10(vC); $_t_SelectedRecordNumber)
					End if 
					
				End for 
				
				IME_Reply("</TR>")
				
				vC:=vC+1
				$_l_CurrentRow:=$_l_CurrentRow+1
				NEXT RECORD:C51($_Ptr_Table->)  //GOTO SELECTED RECORD(»;$_l_CurrentRow)
				
			End while 
			
			//draw totals if any have been requested
			If ($_bo_AreTotals)
				
				IME_ReplyText2("DGListFoot"; "&nbsp;"; "left")  //one for the Select column
				
				For ($_l_ColumnsIndex; 1; $_l_ColumnsCount)
					$_t_TotalText:=""
					
					If (IME_at_DefTotal{$_l_ColumnsIndex}#"")
						
						$_t_TotalText:=""
						$_t_Data:=IME_at_DefData{$_l_ColumnsIndex}
						$_l_SemiColonPosition:=Position:C15(";"; $_t_Data)
						If ($_l_SemiColonPosition>0)
							$_t_Format:=STR_RemoveLeadTrailSpace(Substring:C12($_t_Data; $_l_SemiColonPosition+1))
							$_t_Data:=STR_RemoveLeadTrailSpace(Substring:C12($_t_Data; 1; $_l_SemiColonPosition-1))
						Else 
							$_t_Format:=""
						End if 
						
						$_ptr_Field:=UTI_FieldPointerFromString($_t_Data)
						If (Not:C34(Is nil pointer:C315($_ptr_Field)))
							
							$_l_FieldType:=0
							$_l_TableNumber:=Table:C252($_ptr_Field)
							$_l_FieldNumber:=Field:C253($_ptr_Field)
							GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldNumber; $_l_FieldType)
							Case of 
								: (($_l_FieldType=1) | ($_l_FieldType=8) | ($_l_FieldType=9))  //numeric field
									
									If ((IME_at_DefTotal{$_l_ColumnsIndex}="@sum@") | (IME_at_DefTotal{$_l_ColumnsIndex}="@av@"))
										$_r_Sum:=Sum:C1($_ptr_Field->)
										
										If (IME_at_DefTotal{$_l_ColumnsIndex}="@sum@")
											If ($_t_Format#"")
												$_t_TotalText:=$_t_TotalText+"sum&nbsp;"+String:C10($_r_Sum; $_t_Format)+"<BR>"
											Else 
												$_t_TotalText:=$_t_TotalText+"sum&nbsp;"+String:C10($_r_Sum)+"<BR>"
											End if 
										End if 
										
										If (IME_at_DefTotal{$_l_ColumnsIndex}="@av@")
											$_r_Average:=Round:C94(($_r_Sum/$_l_Number); 2)
											If ($_t_Format#"")
												$_t_TotalText:=$_t_TotalText+"avg&nbsp;"+String:C10($_r_Average; $_t_Format)+"<BR>"
											Else 
												$_t_TotalText:=$_t_TotalText+"avg&nbsp;"+String:C10($_r_Average)+"<BR>"
											End if 
										End if 
										
									End if 
									
							End case 
						End if 
					End if 
					
					If ($_t_TotalText="")
						$_t_TotalText:="&nbsp;"
					End if 
					IME_ReplyText2("DGListFoot"; $_t_TotalText; IME_at_DefAlign{$_l_ColumnsIndex})
					
				End for 
			End if 
			
		End if 
		
		If ($_t_PagingHTML#"")
			IME_Reply($_t_PagingHTML)
		End if 
		
		IME_ReplyText2("ITX DGListTable/")
		
	End if 
	
	IME_ReplyText2("ITX DGListHidden"; String:C10($_l_Page); String:C10($_l_Number); $_t_Sort)
	
	IME_ReplyText2("ITX DGButtList")
	
	IME_DBFooter
	
	UNLOAD RECORD:C212($_Ptr_Table->)
	
End if 
ERR_MethodTrackerReturn("IME_DBList"; $_t_oldMethodName)