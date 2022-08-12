//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      IME_DBListDefCreate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/11/2010 19:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SYS_at_2DFieldNames;0)
	C_BOOLEAN:C305($_bo_Show)
	C_LONGINT:C283($_l_Count; $_l_FieldLength; $_l_FieldNumber; $_l_FieldType; $_l_Index; $_l_MaxColoumns; $_l_SIzeofArray; $_l_TableNumber; $_l_WIdth)
	C_POINTER:C301($_Ptr_FieldPointer; $_ptr_OrderBy; $_ptr_Table; $2; $3)
	C_TEXT:C284($_t_CR; $_t_FunctionName; $_t_ListDefinition; $_t_oldMethodName; $_t_TableName; $_t_VariableName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_DBListDefCreate")
//IME_DBListDefCreate
//Rollo 30/9/2004

//Create default definitions for a listing form for a table
Load_Fields


$_t_FunctionName:=$1
$_ptr_Table:=$2
$_ptr_OrderBy:=$3
RESOLVE POINTER:C394($_ptr_OrderBy; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)

$_t_ListDefinition:=""
$_l_MaxColoumns:=10
$_t_CR:=Char:C90(13)

$_l_TableNumber:=Table:C252($_ptr_Table)
$_t_TableName:=Table name:C256($_ptr_Table)

$_l_TableNumber:=DB_GetTableNumFromNameString($_t_TableName)

If ($_l_TableNumber>0)
	
	$_l_SIzeofArray:=Size of array:C274(<>SYS_at_2DFieldNames{$_l_TableNumber})
	$_l_Index:=1
	$_l_Count:=1
	
	While (($_l_Index<=$_l_SIzeofArray) & ($_l_Count<=$_l_MaxColoumns))
		
		$_Ptr_FieldPointer:=UTI_FieldPointerFromString("["+$_t_TableName+"]"+<>SYS_at_2DFieldNames{$_l_TableNumber}{$_l_Index})
		GET FIELD PROPERTIES:C258($_Ptr_FieldPointer; $_l_FieldType; $_l_FieldLength)
		
		$_bo_Show:=True:C214
		
		Case of 
			: ($_l_FieldType=0)  //alpha
				$_l_WIdth:=Int:C8($_l_FieldLength/10)*40
				If ($_l_WIdth<40)
					$_l_WIdth:=40
				End if 
				
			: ($_l_FieldType=2)  //text
				$_bo_Show:=False:C215
				
			: ($_l_FieldType=1)  //real
				$_l_WIdth:=40
				
			: ($_l_FieldType=8)  //integer
				$_l_WIdth:=40
				
			: ($_l_FieldType=9)  //longint
				$_l_WIdth:=40
				
			: ($_l_FieldType=4)  //date
				$_l_WIdth:=40
				
			: ($_l_FieldType=11)  //time
				$_l_WIdth:=40
				
			: ($_l_FieldType=6)  //boolean
				$_l_WIdth:=40
				
		End case 
		
		If ($_bo_Show)
			
			$_t_ListDefinition:=$_t_ListDefinition+"Data=["+$_t_TableName+"]"+<>SYS_at_2DFieldNames{$_l_TableNumber}{$_l_Index}+$_t_CR
			$_t_ListDefinition:=$_t_ListDefinition+"Label="+<>SYS_at_2DFieldNames{$_l_TableNumber}{$_l_Index}+$_t_CR
			$_t_ListDefinition:=$_t_ListDefinition+"Width="+String:C10($_l_WIdth)+$_t_CR
			If ($_l_Count=1)
				$_t_ListDefinition:=$_t_ListDefinition+"Edit Link=Yes"+$_t_CR
			End if 
			If ($_l_FieldNumber=$_l_Index)
				$_t_ListDefinition:=$_t_ListDefinition+"Sort position=1"+$_t_CR
			End if 
			$_t_ListDefinition:=$_t_ListDefinition+"Sortable=Yes"+$_t_CR+$_t_CR
			
			$_l_Count:=$_l_Count+1
			
			Case of 
				: (<>SYS_at_2DFieldNames{$_l_TableNumber}{$_l_Index}="Company Code")
					$_t_ListDefinition:=$_t_ListDefinition+"Data=IME_RelateOne(->["+$_t_TableName+"]"+<>SYS_at_2DFieldNames{$_l_TableNumber}{$_l_Index}+";->[COMPANIES]Company Name)"+$_t_CR
					$_t_ListDefinition:=$_t_ListDefinition+"Label=Company Name"+$_t_CR
					$_t_ListDefinition:=$_t_ListDefinition+"Width=200"+$_t_CR
					$_t_ListDefinition:=$_t_ListDefinition+"Sortable=No"+$_t_CR+$_t_CR
					
				: (<>SYS_at_2DFieldNames{$_l_TableNumber}{$_l_Index}="Contact Code")
					$_t_ListDefinition:=$_t_ListDefinition+"Data=IME_RelateOne(->["+$_t_TableName+"]"+<>SYS_at_2DFieldNames{$_l_TableNumber}{$_l_Index}+";->[CONTACTS]Contact_Name)"+$_t_CR
					$_t_ListDefinition:=$_t_ListDefinition+"Label=Contact Name"+$_t_CR
					$_t_ListDefinition:=$_t_ListDefinition+"Width=200"+$_t_CR
					$_t_ListDefinition:=$_t_ListDefinition+"Sortable=No"+$_t_CR+$_t_CR
					
			End case 
			
		End if 
		
		$_l_Index:=$_l_Index+1
	End while 
	
End if 

If ($_t_ListDefinition#"")
	READ WRITE:C146([SCRIPTS:80])
	CREATE RECORD:C68([SCRIPTS:80])
	[SCRIPTS:80]Script_Code:1:="ITX DBList"+$_t_FunctionName
	[SCRIPTS:80]Script_Group:9:="List Definition"
	[SCRIPTS:80]Script_Name:2:="Daybook List Definition Default - "+$_t_FunctionName
	[SCRIPTS:80]Recording_Text:4:=$_t_ListDefinition
	SAVE RECORD:C53([SCRIPTS:80])
	UNLOAD RECORD:C212([SCRIPTS:80])
End if 

$0:=$_t_ListDefinition
ERR_MethodTrackerReturn("IME_DBListDefCreate"; $_t_oldMethodName)