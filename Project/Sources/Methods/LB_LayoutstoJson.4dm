//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_LayoutstoJson
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/10/2012 09:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_Enterable; 0)
	ARRAY BOOLEAN:C223($_abo_LockedColumn; 0)
	ARRAY INTEGER:C220($_ai_ColumnFooter; 0)
	ARRAY INTEGER:C220($_ai_ColumnWidth; 0)
	ARRAY INTEGER:C220($_ai_FontSizes; 0)
	ARRAY LONGINT:C221($_al_FieldNumbers; 0)
	ARRAY LONGINT:C221($_al_FieldOrder; 0)
	ARRAY LONGINT:C221($_al_FontStyles; 0)
	ARRAY LONGINT:C221($_al_RelatedField; 0)
	ARRAY LONGINT:C221($_al_RelatedTable; 0)
	ARRAY LONGINT:C221($_al_TableNumber; 0)
	//ARRAY LONGINT(FS_al_FormSortDirection;0)
	//ARRAY LONGINT(FS_al_FormSortFieldNum;0)
	//ARRAY LONGINT(FS_al_FormSortTableNum;0)
	ARRAY POINTER:C280($_aptr_ColumnObjects; 0)
	ARRAY TEXT:C222($_at_ArrayName; 0)
	ARRAY TEXT:C222($_at_ColumnFooter; 0)
	ARRAY TEXT:C222($_at_ColumnFormula; 0)
	ARRAY TEXT:C222($_at_ColumnFormulas; 0)
	ARRAY TEXT:C222($_at_ColumnLabel; 0)
	ARRAY TEXT:C222($_at_FontNames; 0)
	ARRAY TEXT:C222($_at_Format; 0)
	//ARRAY TEXT(FS_at_FormReferences;0)
	//ARRAY TEXT(FS_at_FormSortvariable;0)
	//ARRAY TEXT(FS_S55_FormReference;0)
	C_BOOLEAN:C305(FS_bo_FSettingsLoaded)
	C_LONGINT:C283($_l_Index; $_l_Process; $_l_ProcessState; $_l_ReferencesRow; $_l_SortDirection; $_l_SortFieldNUM; $_l_SortTableNUM; $_l_TableNumber; $_l_TotalWIdth)
	C_POINTER:C301($_ptr_Field; $3; $4; $5)
	C_TEXT:C284($_t_ColumnNames; $_t_ColumnTitles; $_t_ColumnWIdths; $_t_DefinitionsRef; $_t_DefinitionsRefWithUser; $_t_Editable; $_t_oldMethodName; $_t_OutputData; $_t_ProcessName; $_t_SortDirection; $_t_SortFieldName)
	C_TEXT:C284($_t_SortVariableName; $_t_TableNumberString; $0; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_LayoutstoJson")

//Note that beside the Jqgrid data we also want to know
If (Count parameters:C259>=2)
	$_t_DefinitionsRefWithUser:=$1+$2
	$_t_DefinitionsRef:=$1
	QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_t_DefinitionsRefWithUser)
	If (Records in selection:C76([LIST_LAYOUTS:96])=0) | ([LIST_LAYOUTS:96]Layout_Reference:1#($_t_DefinitionsRef+"@"))
		QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_t_DefinitionsRef)
	End if 
	If (Records in selection:C76([LIST_LAYOUTS:96])=0)  //just as in LBI_incFields!
		
		While (Semaphore:C143("Creating"+$1))
			DelayTicks(2)
		End while 
		QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_t_DefinitionsRef)
		If (Records in selection:C76([LIST_LAYOUTS:96])=0)
			//This has to run in a seperate process..or the records don't really exist.
			$_l_Process:=New process:C317("LBi_ListLay"; 128000; "CreateLayoutRecords"+$_t_DefinitionsRef; $_t_DefinitionsRef)
			$_l_ProcessState:=Process state:C330($_l_Process)
			While ($_l_ProcessState>=0)
				$_t_ProcessName:=Process_Name($_l_Process)
				If (("CreateLayoutRecords"+$_t_DefinitionsRef)=$_t_ProcessName)
					DelayTicks(2)
					$_l_ProcessState:=Process state:C330($_l_Process)
				Else 
					$_l_ProcessState:=-1
				End if 
			End while 
			QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_t_DefinitionsRef)
		End if 
		CLEAR SEMAPHORE:C144("Creating"+$_t_DefinitionsRef)
		
	End if 
	//So now we have out 'list layouts records created
	ARRAY LONGINT:C221($_al_TableNumber; 0)
	ARRAY LONGINT:C221($_al_FieldNumbers; 0)
	ARRAY LONGINT:C221($_al_FieldOrder; 0)
	ARRAY TEXT:C222($_at_FontNames; 0)
	
	ARRAY TEXT:C222($_at_Format; 0)
	ARRAY TEXT:C222($_at_ColumnFormula; 0)
	ARRAY TEXT:C222($_at_ColumnLabel; 0)
	ARRAY INTEGER:C220($_ai_ColumnWidth; 0)
	ARRAY TEXT:C222($_at_FontNames; 0)
	ARRAY LONGINT:C221($_al_FontStyles; 0)
	ARRAY BOOLEAN:C223($_abo_Enterable; 0)
	ARRAY BOOLEAN:C223($_abo_LockedColumn; 0)
	ARRAY INTEGER:C220($_ai_FontSizes; 0)
	ARRAY TEXT:C222($_at_ColumnFooter; 0)
	ARRAY INTEGER:C220($_ai_ColumnFooter; 0)
	SELECTION TO ARRAY:C260([LIST_LAYOUTS:96]Table_Number:2; $_al_TableNumber; [LIST_LAYOUTS:96]Field_Number:3; $_al_FieldNumbers; [LIST_LAYOUTS:96]Format:6; $_at_Format; [LIST_LAYOUTS:96]Order:7; $_al_FieldOrder; [LIST_LAYOUTS:96]Formula:9; $_at_ColumnFormula; [LIST_LAYOUTS:96]Title:4; $_at_ColumnLabel; [LIST_LAYOUTS:96]Width:5; $_ai_ColumnWidth)
	SELECTION TO ARRAY:C260([LIST_LAYOUTS:96]Enterable:8; $_abo_Enterable; [LIST_LAYOUTS:96]Locked:10; $_abo_LockedColumn; [LIST_LAYOUTS:96]Font_Size:11; $_ai_FontSizes; [LIST_LAYOUTS:96]Colour:12; $_at_ColumnFooter; [LIST_LAYOUTS:96]Footer:14; $_ai_ColumnFooter; [LIST_LAYOUTS:96]X_Related_Field:16; $_al_RelatedField; [LIST_LAYOUTS:96]X_Related_Table:15; $_al_RelatedTable; [LIST_LAYOUTS:96]X_associatedArrayName:17; $_at_ArrayName)  //used for sub tables only
	SELECTION TO ARRAY:C260([LIST_LAYOUTS:96]X_Font_Name:18; $_at_FontNames; [LIST_LAYOUTS:96]X_Font_Style:19; $_al_FontStyles)
	ARRAY POINTER:C280($_aptr_ColumnObjects; 0)
	ARRAY TEXT:C222($_at_ColumnFormulas; 0)
	
	SORT ARRAY:C229($_al_FieldOrder; $_al_TableNumber; $_al_FieldNumbers; $_at_Format; $_at_ColumnFormula; $_at_ColumnLabel; $_ai_ColumnWidth; $_abo_Enterable; $_abo_LockedColumn; $_ai_FontSizes; $_at_ColumnFooter; $_ai_ColumnFooter; $_at_FontNames; $_al_FontStyles; $_al_RelatedField; $_al_RelatedTable; $_at_ArrayName; >)
	//now need to load this users sort preference for this setup.
	$_t_TableNumberString:=Substring:C12($1; 1; 3)
	$_l_TableNumber:=Num:C11($_t_TableNumberString)
	If (Not:C34(FS_bo_FSettingsLoaded))
		FSettings_loadPreferences($2; "LOCAL")
	End if 
	
	$_l_ReferencesRow:=Find in array:C230(FS_at_FormReferences; $1)
	If ($_l_ReferencesRow>0)
		$_l_SortDirection:=Abs:C99(FS_al_FormSortDirection{$_l_ReferencesRow})
		$_l_SortFieldNUM:=FS_al_FormSortFieldNum{$_l_ReferencesRow}  //note this is the field number not the column
		$_t_SortVariableName:=FS_at_FormSortvariable{$_l_ReferencesRow}
		$_l_SortTableNUM:=FS_al_FormSortTableNum{$_l_ReferencesRow}
	Else 
		$_l_SortDirection:=1
		$_l_SortFieldNUM:=$_al_FieldNumbers{1}
		$_t_SortVariableName:=""
		$_l_SortTableNUM:=$_al_TableNumber{1}
	End if 
	//we do not need to worry about 'special' sorts on email before@-sorting on the web will not be affected
	//sort direction 1=descending 2=ascending
	If ($_l_SortDirection=1)
		$_t_SortDirection:="desc"
	Else 
		$_t_SortDirection:="asc"
	End if 
	$_t_SortFieldName:=""
	If ($_l_SortTableNUM>0)
		For ($_l_Index; 1; Size of array:C274($_al_TableNumber))
			If ($_al_TableNumber{$_l_Index}=$_l_SortTableNUM) & ($_al_FieldNumbers{$_l_Index}=$_l_SortFieldNUM)
				$_t_SortFieldName:=$_at_ColumnLabel{$_l_Index}
			End if 
		End for 
	Else 
		
	End if 
	
	//first we need a json string of the column titles
	$_t_ColumnTitles:=""
	$_t_ColumnNames:=""
	$_t_ColumnWIdths:=""
	$_t_Editable:=""
	$_l_TotalWIdth:=0
	
	//We need each column in the form {name:'id',index:'id', width:55} where name=the
	For ($_l_Index; 1; Size of array:C274($_at_ColumnLabel))
		$_l_TotalWIdth:=$_l_TotalWIdth+$_ai_ColumnWidth{$_l_Index}
		If (Count parameters:C259>=5)
			//ARRAY LONGINT($_al_TableNumber;$_al_FieldNumbers;$_at_Format;$_at_ColumnFormula
			
			If ($_al_TableNumber{$_l_Index}>0) & ($_al_FieldNumbers{$_l_Index}>0)
				$_ptr_Field:=Field:C253($_al_TableNumber{$_l_Index}; $_al_FieldNumbers{$_l_Index})
				APPEND TO ARRAY:C911($4->; $_ptr_Field)
			End if 
			APPEND TO ARRAY:C911($5->; $_at_ColumnFormula{$_l_Index})
		End if 
		If ($_t_ColumnNames#"")
			
			$_t_ColumnTitles:=$_t_ColumnTitles+","+Char:C90(34)+$_at_ColumnLabel{$_l_Index}+Char:C90(34)
			
			$_t_ColumnNames:=$_t_ColumnNames+",{"+Char:C90(34)+"name"+Char:C90(34)+":"+Char:C90(34)+$_at_ColumnLabel{$_l_Index}+Char:C90(34)+","+Char:C90(34)+"index"+Char:C90(34)+":"+Char:C90(34)+$_at_ColumnLabel{$_l_Index}+Char:C90(34)
			$_t_ColumnNames:=$_t_ColumnNames+","+Char:C90(34)+"width"+Char:C90(34)+":"+String:C10($_ai_ColumnWidth{$_l_Index})+"}"
			
			
		Else 
			$_t_ColumnTitles:=Char:C90(34)+$_at_ColumnLabel{$_l_Index}+Char:C90(34)
			
			$_t_ColumnNames:="{"+Char:C90(34)+"name"+Char:C90(34)+":"+Char:C90(34)+$_at_ColumnLabel{$_l_Index}+Char:C90(34)+","+Char:C90(34)+"index"+Char:C90(34)+":"+Char:C90(34)+$_at_ColumnLabel{$_l_Index}+Char:C90(34)
			$_t_ColumnNames:=$_t_ColumnNames+","+Char:C90(34)+"width"+Char:C90(34)+":"+String:C10($_ai_ColumnWidth{$_l_Index})+"}"
			
		End if 
		
	End for 
	
	$_t_OutputData:="["+$_t_ColumnNames+"]"
	
	SET TEXT TO PASTEBOARD:C523($_t_OutputData)
	$0:=$_t_OutputData
	If (Count parameters:C259>=3)
		
		$_t_ColumnTitles:="["+$_t_ColumnTitles+"]"  //make the string an array
		$_t_ColumnNames:="["+$_t_ColumnNames+"]"
		$0:="{"+Char:C90(34)+"columnnames"+Char:C90(34)+":"+$_t_ColumnTitles+","+Char:C90(34)+"columnsetup"+Char:C90(34)+":"+$_t_ColumnNames+","+Char:C90(34)+"columnsortorder"+Char:C90(34)+":["+Char:C90(34)+$_t_SortDirection+Char:C90(34)+"],"+Char:C90(34)+"columsortname"+Char:C90(34)+":["+Char:C90(34)+$_t_SortFieldName+Char:C90(34)+"],"+Char:C90(34)+"GridTotalWidth"+Char:C90(34)+":["+String:C10($_l_TotalWIdth)+"]}"  //make the object
		COPY ARRAY:C226($_at_ColumnLabel; $3->)
		
		
	End if 
	
	
	//{url:"/getdata",datatype:"xml",mtype:"GET",colNames:gridLabeldata,colModel: colmodelstring ,rowNum:10,sortname:"invid",sortorder:"desc",viewrecords: true,gridview: true,width: 600};
	//$0:="{url:"+Char(34)+"/getdata"+Char(34)+",datatype:"+Char(34)+"xml"+Char(34)+",mtype:"+Char(34)+"GET"+Char(34)+",colNames:"+$_t_ColumnTitles+",colModel: "+$_t_OutputData+" ,rowNum:10,sortname:"+Char(34)+$_at_ColumnLabel{1}+Char(34)+",sortorder:"+Char(34)+"desc"+Char(34)+",viewrecords: true,gridview: true,width: 600}"
	
	
	
	//other attributes available are  Possible values: left, center, right.
	//alignstringDefines the alignment of the cell in the Body layer, not in header cell. Possible values: left, center, right.left
	//cellattrfunctionThis function add attributes to the cell during the creation of the data - i.e dynamically. By example all valid attributes for the table cell can be used or a style attribute with different properties. The function should return string. Parameters passed to this function are:
	//rowId - the id of the row
	//val - the value which will be added in the cell
	//rawObject - the raw object of the data row - i.e if datatype is json - array, if datatype is xml xml node.
	//cm - all the properties of this column listed in the colModel
	//rdata - the data row which will be inserted in the row. This parameter is array of type name:value, where name is the name in colModelnull
	//classesstringThis option allow to add classes to the column. If more than one class will be used a space should be set. By example classes:'class1 class2' will set a class1 and class2 to every cell on that column. In the grid css there is a predefined class ui-ellipsis which allow to attach ellipsis to a particular row. Also this will work in FireFox too.empty string
	//datefmtstringGoverns format of sorttype:date (when datetype is set to local) and editrules {date:true} fields. Determines the expected date format for that column. Uses a PHP-like date formatting. Currently ”/”, ”-”, and ”.” are supported as drators. Valid formats are:
	//           y,Y,yyyy for four digits year
	//           YY, yy for two digits year
	//m,mm for months
	//d,dd for days.
	//See Array DataISO Date (Y-m-d)
	//defvalstringThe default value for the search field. This option is used only in Custom Searching and will be set as initial search.empty
	//editablebooleanDefines if the field is editable. This option is used in cell, inline and form modules. See editingfalse
	//editoptionsarrayArray of allowed options (attributes) for edittype option editingempty array
	//editrulesarraysets additional rules for the editable field editingempty array
	//edittypestringDefines the edit type for inline and form editing Possible values: text, textarea, select, checkbox, password, button, image and file. See also editingtext
	//firstsortorderstringIf set to asc or desc, the column will be sorted in that direction on first sort.Subsequent sorts of the column will toggle as usualnull
	//fixedboolean If set to true this option does not allow recalculation of the width of the column if shrinkToFit option is set to true. Also the width does not change if a setGridWidth method is used to change the grid width.false
	//formoptionsarrayDefines various options for form editing. See Form optionsempty
	//formatoptionsarrayFormat options can be defined for particular columns, overwriting the defaults from the language file. See Formatter for more details.none
	//formattermixedThe predefined types (string) or custom function name that controls the format of this field. See Formatter for more details.none
	//frozenbooleanIf set to true determines that this column will be frozen after calling the setFrozenColumns methodfalse
	//hidedlgbooleanIf set to true this column will not appear in the modal dialog where users can choose which columns to show or hide. See Show/Hide Columns.false
	//hiddenbooleanDefines if this column is hidden at initialization.false
	//indexstringSet the index name when sorting. Passed as sidx parameter.empty string
	//jsonmapstringDefines the json mapping for the column in the incoming json string. See Retrieving Datanone
	//keybooleanIn case if there is no id from server, this can be set as as id for the unique row id. Only one column can have this property. If there are more than one key the grid finds the first one and the second is ignored.false
	//labelstringWhen colNames array is empty, defines the heading for this column. If both the colNames array and this setting are empty, the heading for this column comes from the name property.none
	//namestringSet the unique name in the grid for the column. This property is required. As well as other words used as property/event names, the reserved words (which cannot be used for names) include subgrid, cb and rn.Required
	//resizablebooleanDefines if the column can be re sizedtrue
	//searchbooleanWhen used in search modules, disables or enables searching on that column. Search Configurationtrue
	//searchoptionsarrayDefines the search options used searching Search Configurationempty
	//sortablebooleanDefines is this can be sorted.true
	//sorttypemixedUsed when datatype is local. Defines the type of the column for appropriate sorting.Possible values:
	//int/integer - for sorting integer
	//float/number/currency - for sorting decimal numbers
	//date - for sorting date
	//text - for text sorting
	//function - defines a custom function for sorting. To this function we pass the value to be sorted and it should return a value too.
	//See Array Datatext
	//stypestring Determines the type of the element when searching. See Search Configurationtext
	//surlstringValid only in Custom Se;0arching and edittype : 'select' and describes the url from where we can get already-constructed select elementempty string
	//template object Set of valid properties for the colModel. This option can be used if you want to overwrite a lot of default values in the column model with easy. See cmTemplate in grid options null
	//titlebooleanIf this option is false the title is not displayed in that column when we hover a cell with the mousetrue
	//widthnumberSet the initial width of the column, in pixels. This value currently can not be set as percentage150
	//xmlmapstringDefines the xml mapping for the column in the incomming xml file. Use a CSS specification for this See Retrieving Datanone
	//unformatfunction Custom function to “unformat” a value of the cell when used in editing See Custom Formatter. (Unformat is also called during sort operations. The value returned by unformat is the value compared during the sort.)null
	//viewablebooleanThis option is valid only when viewGridRow method is activated. When the option is set to false the column does not appear in view Formtrue
	
End if 
ERR_MethodTrackerReturn("LB_LayoutstoJson"; $_t_oldMethodName)