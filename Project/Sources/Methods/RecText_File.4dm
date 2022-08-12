//%attributes = {}

If (False:C215)
	//Project Method Name:      RecText_File
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
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(<>SYS_at_2DFieldNames;0)
	//ARRAY TEXT(<>SYS_at_CurrentTableFieldNames;0)
	C_BOOLEAN:C305($_bo_Cut; $_bo_NoCr)
	C_LONGINT:C283($_l_EndHighlight; $_l_StartHighlight; $_l_TableNumber)
	C_OBJECT:C1216($_obj_Data; $_obj_Fields; $2)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $_t_TableName; $_t_TableNumber)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("RecText_File")

//Method RectextFile

//Modified NG march 2004
//Was Cutting text off if no CR
If (Count parameters:C259>=2)
	$_obj_Data:=$2
	If (Not:C34($_obj_Data.tableName=Null:C1517))
		$_t_TableName:=$_obj_Data.tableName
	End if 
	If (Not:C34($_obj_Data.tableNumber=Null:C1517))
		$_l_TableNumber:=$_obj_Data.tableNumber
	End if 
Else 
	If (<>DB_at_TableNames>0)
		$_t_TableName:=<>DB_at_TableNames{<>DB_at_TableNames}
	End if 
End if 
If ($_t_TableName#"")
	$_bo_Cut:=False:C215
	GET HIGHLIGHT:C209($1->; $_l_StartHighlight; $_l_EndHighlight)
	
	Case of 
		: ($_l_StartHighlight=$_l_EndHighlight)
			If ($_l_StartHighlight>0) & (Length:C16($1->)>0)
				If ($_l_EndHighlight>Length:C16($1->))  //| (True)
					
					//$_l_StartHighlight:=$_l_EndHighlight-1
					
				Else 
					
					$_bo_Cut:=True:C214
					$_bo_NoCr:=True:C214
					//$_l_StartHighlight:=$_l_EndHighlight-1
					
					
				End if 
			End if 
		Else 
			$_bo_Cut:=True:C214
	End case 
	
	If ($_bo_Cut)
		If (Not:C34($_bo_NoCr))
			If (Length:C16($1->)>=$_l_StartHighlight)
				$1->:=Substring:C12($1->; 0; $_l_StartHighlight-1)+"["+$_t_TableName+"]"+Char:C90(13)+Substring:C12($1->; $_l_EndHighlight; 32000)
			Else 
				$1->:=Substring:C12($1->; 0; $_l_StartHighlight-1)+"["+$_t_TableName+"]"+Char:C90(13)+Substring:C12($1->; $_l_EndHighlight; 32000)
			End if 
			$_l_EndHighlight:=$_l_StartHighlight+Length:C16("["+$_t_TableName+"]")+1
		Else 
			If (Length:C16($1->)>=$_l_StartHighlight)
				$1->:=Substring:C12($1->; 0; $_l_StartHighlight-1)+"["+$_t_TableName+"]"+Substring:C12($1->; $_l_EndHighlight; 32000)
			Else 
				$1->:=Substring:C12($1->; 0; $_l_StartHighlight-1)+"["+$_t_TableName+"]"+Substring:C12($1->; $_l_EndHighlight; 32000)
			End if 
			$_l_EndHighlight:=$_l_StartHighlight+Length:C16("["+$_t_TableName+"]")
		End if 
	Else 
		$1->:=Substring:C12($1->; 0; $_l_StartHighlight)+"["+$_t_TableName+"]"+Substring:C12($1->; $_l_EndHighlight; 32000)
		$_l_EndHighlight:=$_l_StartHighlight+Length:C16("["+$_t_TableName+"]")+2
	End if 
	
	
	HIGHLIGHT TEXT:C210($1->; $_l_StartHighlight; $_l_EndHighlight)
	If ($_l_TableNumber>0)
		$_obj_Fields:=New object:C1471("loadTable"; $_l_TableNumber; "tableNames"; New collection:C1472; "tableNumbers"; New collection:C1472; "fieldNames"; New collection:C1472; "fieldNumbers"; New collection:C1472)
		Load_Fields($_obj_Fields)
		//field names will be collection-
		If ($_obj_Fields.fieldNames.length>0)
			
			$_obj_Data.fieldNames:=$_obj_Fields[0].fieldNames
			$_obj_Data.fieldNumbers:=$_obj_Fields[0].fieldNumbers
			
		End if 
		
	Else 
		COPY ARRAY:C226(<>SYS_at_2DFieldNames{<>DB_at_TableNames}; <>SYS_at_CurrentTableFieldNames)
		<>SYS_at_CurrentTableFieldNames:=1
	End if 
Else 
	If (Count parameters:C259<2)
		<>DB_at_TableNames:=1
	End if 
End if 
ERR_MethodTrackerReturn("RecText_File"; $_t_oldMethodName)
