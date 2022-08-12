//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_DBEditDefCreate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SYS_at_2DFieldNames;0)
	C_BOOLEAN:C305(<>DB_bo_TableNamestatesLoaded; $_bo_Show)
	C_LONGINT:C283($_l_ArraySize; $_l_Count; $_l_FieldLength; $_l_FieldType; $_l_Index; $_l_IndexFind; $_l_IndexMaxCols; $_l_TableNumber; $_l_Width)
	C_POINTER:C301($_Ptr_FieldPointer; $_ptr_Table; $2)
	C_TEXT:C284($_t_CR; $_t_EditDefinitions; $_t_Format; $_t_FunctionName; $_t_oldMethodName; $_t_TableName; $0; $1; $sVarName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_DBEditDefCreate")
//IME_DBEditDefCreate
//Rollo 30/9/2004

//Create default definitions for a edit form for a table
If (Not:C34(<>DB_bo_TableNamestatesLoaded))
	Load_Fields
End if 

$_t_FunctionName:=$1
$_ptr_Table:=$2

$_t_EditDefinitions:=""
$_l_IndexMaxCols:=50
$_t_CR:=Char:C90(13)

$_l_TableNumber:=Table:C252($_ptr_Table)
$_t_TableName:=Table name:C256($_ptr_Table)

$_l_IndexFind:=DB_GetTableNumFromNameString($_t_TableName)

If ($_l_IndexFind>0)
	
	$_l_ArraySize:=Size of array:C274(<>SYS_at_2DFieldNames{$_l_IndexFind})
	$_l_Index:=1
	$_l_Count:=1
	
	While (($_l_Index<=$_l_ArraySize) & ($_l_Count<=$_l_IndexMaxCols))
		
		$_Ptr_FieldPointer:=UTI_FieldPointerFromString("["+$_t_TableName+"]"+<>SYS_at_2DFieldNames{$_l_IndexFind}{$_l_Index})
		GET FIELD PROPERTIES:C258($_Ptr_FieldPointer; $_l_FieldType; $_l_FieldLength)
		
		$_bo_Show:=True:C214
		$_t_Format:=""
		
		Case of 
			: ($_l_FieldType=0)  //alpha
				$_l_Width:=Int:C8($_l_FieldLength/10)*10
				If ($_l_Width<12)
					$_l_Width:=12
				End if 
				
				//check to see if there is a list defined for the field
				QUERY:C277([x_ListUsage:112]; [x_ListUsage:112]x_TableID:3=$_l_TableNumber; *)
				QUERY:C277([x_ListUsage:112];  & ; [x_ListUsage:112]x_FieldID:4=$_l_Index)
				If (Records in selection:C76([x_ListUsage:112])>0)
					QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=[x_ListUsage:112]x_ListID:2)
					If (Records in selection:C76([X_LISTS:111])>0)
						$_t_Format:=";List="+[X_LISTS:111]x_ListName:2
					End if 
				End if 
				REDUCE SELECTION:C351([x_ListUsage:112]; 0)
				REDUCE SELECTION:C351([X_LISTS:111]; 0)
				
			: ($_l_FieldType=2)  //text
				
			: ($_l_FieldType=1)  //real
				$_l_Width:=12
				
			: ($_l_FieldType=8)  //integer
				$_l_Width:=12
				
			: ($_l_FieldType=9)  //longint
				$_l_Width:=12
				
			: ($_l_FieldType=4)  //date
				$_l_Width:=12
				
			: ($_l_FieldType=11)  //time
				$_l_Width:=12
				
			: ($_l_FieldType=6)  //boolean
				$_l_Width:=12
				
		End case 
		
		If ($_bo_Show)
			
			$_t_EditDefinitions:=$_t_EditDefinitions+"Data=["+$_t_TableName+"]"+<>SYS_at_2DFieldNames{$_l_IndexFind}{$_l_Index}+$_t_Format+$_t_CR
			$_t_EditDefinitions:=$_t_EditDefinitions+"Label="+<>SYS_at_2DFieldNames{$_l_IndexFind}{$_l_Index}+$_t_CR
			If ($_l_FieldType=2)  //text
				$_t_EditDefinitions:=$_t_EditDefinitions+"Rows=4"+$_t_CR
				$_t_EditDefinitions:=$_t_EditDefinitions+"Cols=60"+$_t_CR
			Else 
				$_t_EditDefinitions:=$_t_EditDefinitions+"Size="+String:C10($_l_Width)+$_t_CR
			End if 
			$_t_EditDefinitions:=$_t_EditDefinitions+$_t_CR
			
			$_l_Count:=$_l_Count+1
			
		End if 
		
		$_l_Index:=$_l_Index+1
	End while 
	
End if 

If ($_t_EditDefinitions#"")
	READ WRITE:C146([SCRIPTS:80])
	CREATE RECORD:C68([SCRIPTS:80])
	[SCRIPTS:80]Script_Code:1:="ITX DBEdit"+$_t_FunctionName
	[SCRIPTS:80]Script_Group:9:="Edit Definition"
	[SCRIPTS:80]Script_Name:2:="Daybook Edit Definition Default - "+$_t_FunctionName
	[SCRIPTS:80]Recording_Text:4:=$_t_EditDefinitions
	SAVE RECORD:C53([SCRIPTS:80])
	UNLOAD RECORD:C212([SCRIPTS:80])
End if 

$0:=$_t_EditDefinitions
ERR_MethodTrackerReturn("IME_DBEditDefCreate"; $_t_oldMethodName)