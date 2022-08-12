//%attributes = {"lang":"en","shared":true,"invisible":true}
If (False:C215)
	//-------------------- Method Set Up -------------------
	//Project Method Name:      CODE_GetCompilerDirectives
	//Parameter Detail:
	//------------------ Method Narrative ------------------
	
	//------------------ Methods/Table List ----------------
	
	//Table(If any): 
	
	//Module: 
	
	//Calling Menu/Method/Form/Object Method: 
	//
	//Related Methods: 
	
	//
	//------------------ Assumptions ----------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/03/2017
	//Created BY: Nigel Greenlee
	
	////18/03/2017
	//Modified By: Nigel Greenlee
	
End if 
//---------- Type Parameters & Local Variables ----------
If (True:C214)
	ARRAY TEXT:C222($_at_Declarations; 0)
	ARRAY TEXT:C222($atMethodPaths; 0)
	C_BOOLEAN:C305($_bo_2d; $_bo_SetText)
	C_LONGINT:C283($_l_Position; $_L_ref)
	C_POINTER:C301($_Ptr_Global2Ds; $_ptr_GlobalVarNames; $_ptr_GobalVarTypes; $_ptr_HostCompilerDirArrays; $_ptr_HostCompilerDirInterArrays; $_ptr_HostCompilerDirIntervars; $_ptr_HostCompilerDirvars; $_Ptr_Process2Ds; $_ptr_ProcessVarNames; $_ptr_ProcessVarTypes; $1)
	C_POINTER:C301($10; $2; $3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_ArrayName; $_t_MethodText; $_t_ThisLine; $_t_Type; $_t_VariableName)
End if 
//---------- Reassign Passed Parameters OR get values ----------

If (Count parameters:C259>=1)
	If (False:C215)
		$_ptr_GlobalVarNames:=$1
		$_ptr_GobalVarTypes:=$2
		$_Ptr_Global2Ds:=$3
		$_ptr_ProcessVarNames:=$4
		$_ptr_ProcessVarTypes:=$5
		$_Ptr_Process2Ds:=$6
		If (Count parameters:C259>=7)
			$_bo_SetText:=True:C214
			$_ptr_HostCompilerDirArrays:=$7
			$_ptr_HostCompilerDirInterArrays:=$8
			$_ptr_HostCompilerDirvars:=$9
			$_ptr_HostCompilerDirIntervars:=$10
			//CODE_GetCompilerDirectives (->$_at_GVariableNames;->$_At_GVariableTypes;->$_abo_G2DArray;->$_at_pVariableNames;->$_At_pVariableTypes;->$_abo_p2DArray)
		End if 
	Else 
		ARRAY TEXT:C222($_At_GVariableTypes; 0)
		ARRAY TEXT:C222($_at_GVariableNames; 0)
		ARRAY BOOLEAN:C223($_abo_G2DArray; 0)
		ARRAY TEXT:C222($_At_pVariableTypes; 0)
		ARRAY TEXT:C222($_at_pVariableNames; 0)
		ARRAY BOOLEAN:C223($_abo_p2DArray; 0)
		ARRAY LONGINT:C221($_al_GVariableLengths; 0)
		ARRAY LONGINT:C221($_al_PVariableLength; 0)
		
		C_TEXT:C284($_t_HostCompilerDirArrays; $_T_HostCompilerDirIntArrays; $_t_HostCompilerDirvars; $_t_HostCompilerDirIntervars)
		$_ptr_GlobalVarNames:=->$_at_GVariableNames
		$_ptr_GobalVarTypes:=->$_At_GVariableTypes
		$_Ptr_Global2Ds:=->$_abo_G2DArray
		$_Ptr_GVariableLengths:=->$_al_GVariableLengths
		$_ptr_ProcessVarNames:=->$_at_pVariableNames
		$_ptr_ProcessVarTypes:=->$_At_pVariableTypes
		$_Ptr_Process2Ds:=->$_abo_p2DArray
		$_Ptr_PVariableLengths:=->$_al_PVariableLength
		
		$_bo_SetText:=True:C214
		$_ptr_HostCompilerDirArrays:=->$_t_HostCompilerDirArrays
		$_ptr_HostCompilerDirInterArrays:=->$_T_HostCompilerDirIntArrays
		$_ptr_HostCompilerDirvars:=->$_t_HostCompilerDirvars
		$_ptr_HostCompilerDirIntervars:=->$_t_HostCompilerDirIntervars
		//CODE_GetCompilerDirectives (->$_at_GVariableNames;->$_At_GVariableTypes;->$_abo_G2DArray;->$_at_pVariableNames;->$_At_pVariableTypes;->$_abo_p2DArray)
		C_TEXT:C284(<>DIF_t_ArraysDirectives)
	End if 
	
Else 
	
	
	
	
End if 

//-------------------- Main Method -------------------
ARRAY TEXT:C222($_at_Declarations; 0)
APPEND TO ARRAY:C911($_at_Declarations; "ARRAY TEXT")
APPEND TO ARRAY:C911($_at_Declarations; "_o_"+"ARRAY STRING")
APPEND TO ARRAY:C911($_at_Declarations; "ARRAY STRING")
APPEND TO ARRAY:C911($_at_Declarations; "ARRAY LONGINT")
APPEND TO ARRAY:C911($_at_Declarations; "ARRAY REAL")
APPEND TO ARRAY:C911($_at_Declarations; "ARRAY INTEGER")
APPEND TO ARRAY:C911($_at_Declarations; "_o_"+"ARRAY INTEGER")
APPEND TO ARRAY:C911($_at_Declarations; "ARRAY BOOLEAN")
APPEND TO ARRAY:C911($_at_Declarations; "ARRAY OBJECT")
APPEND TO ARRAY:C911($_at_Declarations; "ARRAY BLOB")
APPEND TO ARRAY:C911($_at_Declarations; "ARRAY TIME")
APPEND TO ARRAY:C911($_at_Declarations; "ARRAY TEXT")
APPEND TO ARRAY:C911($_at_Declarations; "ARRAY DATE")
APPEND TO ARRAY:C911($_at_Declarations; "ARRAY PICTURE")
APPEND TO ARRAY:C911($_at_Declarations; "ARRAY POINTER")
APPEND TO ARRAY:C911($_at_Declarations; "C_TEXT")
APPEND TO ARRAY:C911($_at_Declarations; "_o_"+"C_STRING")
APPEND TO ARRAY:C911($_at_Declarations; "C_STRING")

APPEND TO ARRAY:C911($_at_Declarations; "C_LONGINT")
APPEND TO ARRAY:C911($_at_Declarations; "C_REAL")
APPEND TO ARRAY:C911($_at_Declarations; "_o_"+"C_INTEGER")
APPEND TO ARRAY:C911($_at_Declarations; "C_INTEGER")

APPEND TO ARRAY:C911($_at_Declarations; "C_BOOLEAN")
APPEND TO ARRAY:C911($_at_Declarations; "C_OBJECT")
APPEND TO ARRAY:C911($_at_Declarations; "C_BLOB")
APPEND TO ARRAY:C911($_at_Declarations; "C_TIME")
APPEND TO ARRAY:C911($_at_Declarations; "C_TEXT")
APPEND TO ARRAY:C911($_at_Declarations; "C_DATE")
APPEND TO ARRAY:C911($_at_Declarations; "C_PICTURE")
APPEND TO ARRAY:C911($_at_Declarations; "C_POINTER")
C_TEXT:C284(<>DIF_t_ArraysDirectives; <>DIF_t_ArraysInterDirectives; <>DIF_t_VarsDirectives; <>DIF_t_VarsInterDirectives)
$_t_ArraysMethodText:=""
$_t_ArraysInterMethodText:=""
$_t_MethodText:=""
$_bo_LoadOtherDirectives:=False:C215
$_b_LoadCompilerArrays:=False:C215
$_b_LoadInterArrays:=False:C215
$_b_LoadVarsDirectives:=False:C215
$_b_LoadVarsDirectives:=False:C215
$_b_LoadVarsDirectives:=False:C215
$_b_loadInterVarsDirectives:=False:C215
//$_t_MethodText:=Document to text(Document)

$_t_Pattern:="((?:\\/\\*(?:[^*]|(?:\\*+[^*\\/]))*\\*+\\/)|(?:\\/\\/.*))"




ARRAY TEXT:C222($atMethodPaths; 0)
METHOD GET PATHS:C1163(Path project method:K72:1; $atMethodPaths; *)
$_b_LoadCompilerArrays:=False:C215

$_L_ref:=Find in array:C230($atMethodPaths; "Compiler_Arrays")
If ($_L_ref>0)
	$_t_ArraysMethodText:=""
	METHOD GET CODE:C1190($atMethodPaths{$_L_ref}; $_t_ArraysMethodText; *)
	$_l_Start:=1
	While (Match regex:C1019($_t_Pattern; $_t_ArraysMethodText; $_l_Start; $_l_Found; $_l_Length))
		$_t_ArraysMethodText:=Delete string:C232($_t_ArraysMethodText; $_l_Found; $_l_Length)
		$_l_Start:=$_l_Found
	End while 
	
	If ($_t_ArraysMethodText="")
		If (Undefined:C82(<>DIF_at_ProcessVarNames))
			ARRAY TEXT:C222(<>DIF_at_ProcessVarNames; 0)
			ARRAY TEXT:C222(<>DIF_at_ProcessVarTypes; 0)
			ARRAY TEXT:C222(<>DIF_at_Process2Ds; 0)
			ARRAY LONGINT:C221(<>DIF_al_ProcessVarLength; 0)
			
		End if 
	End if 
	If ($_t_ArraysMethodText#<>DIF_t_ArraysDirectives)
		<>DIF_t_ArraysDirectives:=$_t_ArraysMethodText
		$_bo_LoadOtherDirectives:=True:C214
		$_b_LoadCompilerArrays:=True:C214
	End if 
	
End if 
$_L_ref:=Find in array:C230($atMethodPaths; "Compiler_Arrays_inter")
If ($_L_ref>0)
	$_t_ArraysInterMethodText:=""
	METHOD GET CODE:C1190($atMethodPaths{$_L_ref}; $_t_ArraysInterMethodText; *)
	$_l_Start:=1
	While (Match regex:C1019($_t_Pattern; $_t_ArraysInterMethodText; $_l_Start; $_l_Found; $_l_Length))
		$_t_ArraysInterMethodText:=Delete string:C232($_t_ArraysInterMethodText; $_l_Found; $_l_Length)
		$_l_Start:=$_l_Found
	End while 
	If ($_t_ArraysInterMethodText="")
		If (Undefined:C82(<>DIF_at_GlobalVarNames))
			ARRAY TEXT:C222(<>DIF_at_GlobalVarNames; 0)
			ARRAY TEXT:C222(<>DIF_at_GlobalVarTypes; 0)
			ARRAY TEXT:C222(<>DIF_at_Global2Ds; 0)
			ARRAY LONGINT:C221(<>DIF_al_GlobalVarLength; 0)
			
		End if 
	End if 
	If ($_t_ArraysInterMethodText#<>DIF_t_ArraysInterDirectives) | ($_bo_LoadOtherDirectives)
		<>DIF_t_ArraysInterDirectives:=$_t_ArraysInterMethodText
		$_b_LoadCompilerArrays:=True:C214
		$_b_LoadInterArrays:=True:C214
		$_bo_LoadOtherDirectives:=True:C214
	End if 
	
End if 
$_L_ref:=Find in array:C230($atMethodPaths; "Compiler_Variables")
If ($_L_ref>0)
	$_t_ComVarsMethodText:=""
	METHOD GET CODE:C1190($atMethodPaths{$_L_ref}; $_t_ComVarsMethodText; *)
	$_l_Start:=1
	While (Match regex:C1019($_t_Pattern; $_t_ComVarsMethodText; $_l_Start; $_l_Found; $_l_Length))
		$_t_ComVarsMethodText:=Delete string:C232($_t_ComVarsMethodText; $_l_Found; $_l_Length)
		$_l_Start:=$_l_Found
	End while 
	If ($_t_ComVarsMethodText="")
		If (Undefined:C82(<>DIF_at_ProcessVarNames))
			ARRAY TEXT:C222(<>DIF_at_ProcessVarNames; 0)
			ARRAY TEXT:C222(<>DIF_at_ProcessVarTypes; 0)
			ARRAY TEXT:C222(<>DIF_at_Process2Ds; 0)
			ARRAY LONGINT:C221(<>DIF_al_ProcessVarLength; 0)
			
		End if 
	End if 
	
	If ($_t_ComVarsMethodText#<>DIF_t_VarsDirectives) | ($_bo_LoadOtherDirectives)
		<>DIF_t_VarsDirectives:=$_t_ComVarsMethodText
		$_b_LoadCompilerArrays:=True:C214
		$_b_LoadInterArrays:=True:C214
		$_b_LoadVarsDirectives:=True:C214
		$_bo_LoadOtherDirectives:=True:C214
	End if 
	
End if 

$_L_ref:=Find in array:C230($atMethodPaths; "Compiler_Variables_inter")
If ($_L_ref>0)
	$_t_ComVarsInterMethodText:=""
	METHOD GET CODE:C1190($atMethodPaths{$_L_ref}; $_t_ComVarsInterMethodText; *)
	$_l_Start:=1
	While (Match regex:C1019($_t_Pattern; $_t_ComVarsInterMethodText; $_l_Start; $_l_Found; $_l_Length))
		$_t_ComVarsInterMethodText:=Delete string:C232($_t_ComVarsInterMethodText; $_l_Found; $_l_Length)
		$_l_Start:=$_l_Found
	End while 
	If ($_t_ComVarsInterMethodText="")
		If (Undefined:C82(<>DIF_at_GlobalVarNames))
			ARRAY TEXT:C222(<>DIF_at_GlobalVarNames; 0)
			ARRAY TEXT:C222(<>DIF_at_GlobalVarTypes; 0)
			ARRAY TEXT:C222(<>DIF_at_Global2Ds; 0)
			ARRAY LONGINT:C221(<>DIF_al_GlobalVarLength; 0)
			
		End if 
		
	End if 
	If ($_t_ComVarsInterMethodText#<>DIF_t_VarsInterDirectives) | ($_bo_LoadOtherDirectives)
		<>DIF_t_VarsInterDirectives:=$_t_ComVarsInterMethodText
		$_b_LoadCompilerArrays:=True:C214
		$_b_LoadInterArrays:=True:C214
		$_b_LoadVarsDirectives:=True:C214
		$_b_loadInterVarsDirectives:=True:C214
		$_bo_LoadOtherDirectives:=True:C214
	End if 
	
End if 


If ($_b_LoadCompilerArrays)
	DIF_t_ArraysDirectives:=$_t_ArraysMethodText
	$_t_MethodText:=$_t_ArraysMethodText
	///
	$_l_Start:=1
	While (Match regex:C1019($_t_Pattern; $_t_MethodText; $_l_Start; $_l_Found; $_l_Length))
		$_t_MethodText:=Delete string:C232($_t_MethodText; $_l_Found; $_l_Length)
		$_l_Start:=$_l_Found
	End while 
	
	///
	$_bo_LoadOtherDirectives:=True:C214
	If ($_bo_SetText)
		$_ptr_HostCompilerDirArrays->:=$_t_MethodText
	End if 
	$_l_Position:=Position:C15("ARRAY "; $_t_MethodText)
	$_l_Position2:=Position:C15(("_o_"+"ARRAY "); $_t_MethodText)
	If ($_l_Position2<$_l_Position) & ($_l_Position2>0)
		$_l_Position:=$_l_Position2
	End if 
	
	$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
	Repeat 
		$_l_Position:=Position:C15(Char:C90(13); $_t_MethodText)
		If ($_l_Position>0)
			$_t_ThisLine:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
			$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
			
		Else 
			$_t_ThisLine:=$_t_MethodText
			$_t_MethodText:=""
			
		End if 
		If ($_t_ThisLine#"")
			$_t_Type:=""
			$_t_Length:=""
			Case of 
				: (Position:C15(("_o_"+"Array STRING"); $_t_ThisLine)>0)
					$_l_Position:=Position:C15("_o_"+"Array STRING"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; ("_o_"+"Array STRING("); "")
					$_l_POsition:=Position:C15(";"; $_t_ThisLine)
					$_t_Length:=Substring:C12($_t_ThisLine; 1; $_l_POsition-1)
					$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_POsition+1)
					$_t_Type:="_o_"+"Array STRING"
				: (Position:C15("Array STRING"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("Array STRING"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "Array STRING("; "")
					$_l_POsition:=Position:C15(";"; $_t_ThisLine)
					$_t_Length:=Substring:C12($_t_ThisLine; 1; $_l_POsition-1)
					$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_POsition+1)
					$_t_Type:="Array STRING"
				: (Position:C15("Array TEXT"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("Array TEXT"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "Array TEXT("; "")
					$_t_Type:="Array TEXT"
				: (Position:C15("Array LONGINT"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("Array LONGINT"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "Array LONGINT("; "")
					
					$_t_Type:="Array LONGINT"
				: (Position:C15("Array REAL"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("Array REAL"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "Array REAL("; "")
					$_t_Type:="Array REAL"
				: (Position:C15(("_o_"+"Array INTEGER"); $_t_ThisLine)>0)
					$_l_Position:=Position:C15("_o_"+"Array INTEGER"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; ("_o_"+"Array INTEGER("); "")
					$_t_Type:="_o_"+"Array INTEGER"
				: (Position:C15("Array INTEGER"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("Array INTEGER"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "Array INTEGER("; "")
					$_t_Type:="Array INTEGER"
				: (Position:C15("Array BOOLEAN"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("ARRAY BOOLEAN"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "Array BOOLEAN("; "")
					$_t_Type:="Array BOOLEAN"
				: (Position:C15("Array OBJECT"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("Array OBJECT"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "Array OBJECT("; "")
					$_t_Type:="Array OBJECT"
				: (Position:C15("Array BLOB"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("Array BLOB"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "Array BLOB("; "")
					$_t_Type:="Array BLOB"
				: (Position:C15("Array TIME"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("Array TIME"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "Array TIME("; "")
					$_t_Type:="Array TIME"
				: (Position:C15("Array DATE"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("Array DATE"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "Array DATE("; "")
					$_t_Type:="Array DATE"
				: (Position:C15("Array PICTURE"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("Array PICTURE"; $_t_ThisLine)
					If ($_l_Position>1)
						
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "Array PICTURE("; "")
					$_t_Type:="Array PICTURE"
				: (Position:C15("Array POINTER"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("Array POINTER"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "Array POINTER("; "")
					$_t_Type:="Array POINTER"
			End case 
			$_l_Position:=Position:C15(";"; $_t_ThisLine)
			$_t_ArrayName:=Substring:C12($_t_ThisLine; 1; $_l_Position-1)
			$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position+1)
			$_l_Position:=Position:C15(";"; $_t_ThisLine)
			$_bo_2d:=False:C215
			If ($_l_Position>0)
				$_bo_2d:=True:C214
			End if 
			
			APPEND TO ARRAY:C911($_ptr_ProcessVarNames->; $_t_ArrayName)
			APPEND TO ARRAY:C911($_ptr_ProcessVarTypes->; $_t_Type)
			APPEND TO ARRAY:C911($_Ptr_Process2Ds->; $_bo_2d)
			APPEND TO ARRAY:C911($_Ptr_PVariableLengths->; Num:C11($_t_ThisLine))
		End if 
		
		
	Until ($_t_MethodText="")
	ARRAY TEXT:C222(<>DIF_at_ProcessVarNames; 0)
	ARRAY TEXT:C222(<>DIF_at_ProcessVarTypes; 0)
	ARRAY TEXT:C222(<>DIF_at_Process2Ds; 0)
	ARRAY LONGINT:C221(<>DIF_al_ProcessVarLength; 0)
	
	COPY ARRAY:C226($_ptr_ProcessVarNames->; <>DIF_at_ProcessVarNames)
	COPY ARRAY:C226($_ptr_ProcessVarTypes->; <>DIF_at_ProcessVarTypes)
	COPY ARRAY:C226($_Ptr_Process2Ds->; <>DIF_at_Process2Ds)
	COPY ARRAY:C226($_Ptr_PVariableLengths->; <>DIF_al_ProcessVarLength)
	
Else 
	COPY ARRAY:C226(<>DIF_at_ProcessVarNames; $_ptr_ProcessVarNames->)
	COPY ARRAY:C226(<>DIF_at_ProcessVarTypes; $_ptr_ProcessVarTypes->)
	COPY ARRAY:C226(<>DIF_at_Process2Ds; $_Ptr_Process2Ds->)
	COPY ARRAY:C226(<>DIF_al_ProcessVarLength; $_Ptr_PVariableLengths->)
	
	
	
End if 

If ($_b_LoadInterArrays)
	$_t_MethodText:=$_t_ArraysInterMethodText
	$_l_Start:=1
	While (Match regex:C1019($_t_Pattern; $_t_MethodText; $_l_Start; $_l_Found; $_l_Length))
		$_t_MethodText:=Delete string:C232($_t_MethodText; $_l_Found; $_l_Length)
		$_l_Start:=$_l_Found
	End while 
	
	If ($_bo_SetText)
		$_ptr_HostCompilerDirInterArrays->:=$_t_MethodText
	End if 
	$_l_Position:=Position:C15("ARRAY "; $_t_MethodText)
	$_l_Position2:=Position:C15(("_o_"+"ARRAY "); $_t_MethodText)
	If ($_l_Position2<$_l_Position) & ($_l_Position2>0)
		$_l_Position:=$_l_Position2
	End if 
	$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
	Repeat 
		$_l_Position:=Position:C15(Char:C90(13); $_t_MethodText)
		If ($_l_Position>0)
			$_t_ThisLine:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
			$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
			
		Else 
			$_t_ThisLine:=$_t_MethodText
			$_t_MethodText:=""
			
		End if 
		If ($_t_ThisLine#"")
			$_t_Type:=""
			$_t_Length:=""
			Case of 
				: (Position:C15(("_o_"+"Array STRING"); $_t_ThisLine)>0)
					$_l_Position:=Position:C15("_o_"+"Array STRING"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; ("_o_"+"Array STRING("); "")
					$_l_POsition:=Position:C15(";"; $_t_ThisLine)
					$_t_Length:=Substring:C12($_t_ThisLine; 1; $_l_POsition-1)
					$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_POsition+1)
					$_t_Type:="_o_"+"Array STRING"
				: (Position:C15("Array STRING"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("Array STRING"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "Array STRING("; "")
					$_l_POsition:=Position:C15(";"; $_t_ThisLine)
					$_t_Length:=Substring:C12($_t_ThisLine; 1; $_l_POsition-1)
					$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_POsition+1)
					$_t_Type:="Array STRING"
				: (Position:C15("Array TEXT"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("Array TEXT"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "Array TEXT("; "")
					$_t_Type:="Array TEXT"
				: (Position:C15("Array LONGINT"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("Array LONGINT"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "Array LONGINT("; "")
					
					$_t_Type:="Array LONGINT"
				: (Position:C15("Array REAL"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("Array REAL"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "Array REAL("; "")
					$_t_Type:="Array REAL"
				: (Position:C15(("_o_"+"Array INTEGER"); $_t_ThisLine)>0)
					$_l_Position:=Position:C15("_o_"+"Array INTEGER"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; ("_o_"+"Array INTEGER("); "")
					$_t_Type:="_o_"+"Array INTEGER"
				: (Position:C15("Array INTEGER"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("Array INTEGER"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "Array INTEGER("; "")
					$_t_Type:="Array INTEGER"
				: (Position:C15("Array BOOLEAN"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("ARRAY BOOLEAN"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "Array BOOLEAN("; "")
					$_t_Type:="Array BOOLEAN"
				: (Position:C15("Array OBJECT"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("Array OBJECT"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "Array OBJECT("; "")
					$_t_Type:="Array OBJECT"
				: (Position:C15("Array BLOB"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("Array BLOB"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "Array BLOB("; "")
					$_t_Type:="Array BLOB"
				: (Position:C15("Array TIME"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("Array TIME"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "Array TIME("; "")
					$_t_Type:="Array TIME"
				: (Position:C15("Array DATE"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("Array DATE"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "Array DATE("; "")
					$_t_Type:="Array DATE"
				: (Position:C15("Array PICTURE"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("Array PICTURE"; $_t_ThisLine)
					If ($_l_Position>1)
						
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "Array PICTURE("; "")
					$_t_Type:="Array PICTURE"
				: (Position:C15("Array POINTER"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("Array POINTER"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "Array POINTER("; "")
					$_t_Type:="Array POINTER"
			End case 
			
			$_l_Position:=Position:C15(";"; $_t_ThisLine)
			$_t_ArrayName:=Substring:C12($_t_ThisLine; 1; $_l_Position-1)
			$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position+1)
			$_l_Position:=Position:C15(";"; $_t_ThisLine)
			$_bo_2d:=False:C215
			If ($_l_Position>0)
				$_bo_2d:=True:C214
			End if 
			APPEND TO ARRAY:C911($_ptr_GlobalVarNames->; $_t_ArrayName)
			APPEND TO ARRAY:C911($_ptr_GobalVarTypes->; $_t_Type)
			APPEND TO ARRAY:C911($_Ptr_Global2Ds->; $_bo_2d)
			APPEND TO ARRAY:C911($_Ptr_GVariableLengths->; Num:C11($_t_Length))
			
			
		End if 
		
		
	Until ($_t_MethodText="")
	
	ARRAY TEXT:C222(<>DIF_at_GlobalVarNames; 0)
	ARRAY TEXT:C222(<>DIF_at_GlobalVarTypes; 0)
	ARRAY TEXT:C222(<>DIF_at_Global2Ds; 0)
	ARRAY LONGINT:C221(<>DIF_al_GlobalVarLength; 0)
	COPY ARRAY:C226($_ptr_GlobalVarNames->; <>DIF_at_GlobalVarNames)
	COPY ARRAY:C226($_ptr_GobalVarTypes->; <>DIF_at_GlobalVarTypes)
	COPY ARRAY:C226($_Ptr_Global2Ds->; <>DIF_at_Global2Ds)
	COPY ARRAY:C226($_Ptr_GVariableLengths->; <>DIF_al_GlobalVarLength)
Else 
	COPY ARRAY:C226(<>DIF_at_GlobalVarNames; $_ptr_GlobalVarNames->)
	COPY ARRAY:C226(<>DIF_at_GlobalVarTypes; $_ptr_GobalVarTypes->)
	COPY ARRAY:C226(<>DIF_at_Global2Ds; $_Ptr_Global2Ds->)
	COPY ARRAY:C226(<>DIF_al_GlobalVarLength; $_Ptr_GVariableLengths->)
	
End if 

If ($_b_LoadVarsDirectives)
	$_t_MethodText:=$_t_ComVarsMethodText
	$_l_Start:=1
	While (Match regex:C1019($_t_Pattern; $_t_MethodText; $_l_Start; $_l_Found; $_l_Length))
		$_t_MethodText:=Delete string:C232($_t_MethodText; $_l_Found; $_l_Length)
		$_l_Start:=$_l_Found
	End while 
	
	If ($_bo_SetText)
		$_ptr_HostCompilerDirvars->:=$_t_MethodText
	End if 
	$_l_Position:=Position:C15("C_"; $_t_MethodText)
	$_l_Position2:=Position:C15(("_o_"+"C_"); $_t_MethodText)
	If ($_l_Position2<$_l_Position) & ($_l_Position2>0)
		$_l_Position:=$_l_Position2
	End if 
	$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
	Repeat 
		$_l_Position:=Position:C15(Char:C90(13); $_t_MethodText)
		If ($_l_Position>0)
			$_t_ThisLine:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
			$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
			
		Else 
			$_t_ThisLine:=$_t_MethodText
			$_t_MethodText:=""
			
		End if 
		If ($_t_ThisLine#"")
			$_t_Type:=""
			$_t_Length:=""
			Case of 
				: (Position:C15(("_o_"+"C_STRING"); $_t_ThisLine)>0)
					$_l_Position:=Position:C15("_o_"+"C_STRING"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; ("_o_"+"C_STRING("); "")
					$_l_POsition:=Position:C15(";"; $_t_ThisLine)
					$_t_Length:=Substring:C12($_t_ThisLine; 1; $_l_POsition-1)
					$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_POsition+1)
					$_t_Type:="_o_"+"C_STRING"
				: (Position:C15("C_STRING"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("C_STRING"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "C_STRING("; "")
					$_l_POsition:=Position:C15(";"; $_t_ThisLine)
					$_t_Length:=Substring:C12($_t_ThisLine; 1; $_l_POsition-1)
					$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_POsition+1)
					$_t_Type:="C_STRING"
				: (Position:C15("C_TEXT"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("C_TEXT"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "C_TEXT("; "")
					$_t_Type:="C_TEXT"
				: (Position:C15("C_LONGINT"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("C_LONGINT"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "C_LONGINT("; "")
					
					$_t_Type:="C_LONGINT"
				: (Position:C15("C_REAL"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("C_REAL"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "C_REAL("; "")
					$_t_Type:="C_REAL"
				: (Position:C15(("_o_"+"C_INTEGER"); $_t_ThisLine)>0)
					$_l_Position:=Position:C15("_o_"+"C_INTEGER"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; ("_o_"+"C_INTEGER("); "")
					$_t_Type:="_o_"+"C_INTEGER"
				: (Position:C15("C_INTEGER"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("C_INTEGER"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "C_INTEGER("; "")
					$_t_Type:="C_INTEGER"
				: (Position:C15("C_BOOLEAN"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("C_BOOLEAN"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "C_BOOLEAN("; "")
					$_t_Type:="C_BOOLEAN"
				: (Position:C15("C_OBJECT"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("C_OBJECT"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "C_OBJECT("; "")
					$_t_Type:="C_OBJECT"
				: (Position:C15("C_BLOB"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("C_BLOB"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "C_BLOB("; "")
					$_t_Type:="C_BLOB"
				: (Position:C15("C_TIME"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("C_TIME"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "C_TIME("; "")
					$_t_Type:="C_TIME"
				: (Position:C15("C_DATE"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("C_DATE"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "C_DATE("; "")
					$_t_Type:="C_DATE"
				: (Position:C15("C_PICTURE"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("C_PICTURE"; $_t_ThisLine)
					If ($_l_Position>1)
						
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "C_PICTURE("; "")
					$_t_Type:="C_PICTURE"
				: (Position:C15("C_POINTER"; $_t_ThisLine)>0)
					$_l_Position:=Position:C15("C_POINTER"; $_t_ThisLine)
					If ($_l_Position>1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
					End if 
					$_t_ThisLine:=Replace string:C233($_t_ThisLine; "C_POINTER("; "")
					$_t_Type:="C_POINTER"
			End case 
			$_l_Position:=Position:C15(")"; $_t_ThisLine)
			$_t_VariableName:=Substring:C12($_t_ThisLine; 1; $_l_Position-1)
			$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position+1)
			APPEND TO ARRAY:C911($_ptr_ProcessVarNames->; $_t_VariableName)
			APPEND TO ARRAY:C911($_ptr_ProcessVarTypes->; $_t_Type)
			APPEND TO ARRAY:C911($_Ptr_Process2Ds->; False:C215)
			APPEND TO ARRAY:C911($_Ptr_PVariableLengths->; Num:C11($_t_ThisLine))
		End if 
		
		
	Until ($_t_MethodText="")
	ARRAY TEXT:C222(<>DIF_at_ProcessVarNames; 0)
	ARRAY TEXT:C222(<>DIF_at_ProcessVarTypes; 0)
	ARRAY TEXT:C222(<>DIF_at_Process2Ds; 0)
	ARRAY LONGINT:C221(<>DIF_al_ProcessVarLength; 0)
	
	COPY ARRAY:C226($_ptr_ProcessVarNames->; <>DIF_at_ProcessVarNames)
	COPY ARRAY:C226($_ptr_ProcessVarTypes->; <>DIF_at_ProcessVarTypes)
	COPY ARRAY:C226($_Ptr_Process2Ds->; <>DIF_at_Process2Ds)
	COPY ARRAY:C226($_Ptr_PVariableLengths->; <>DIF_al_ProcessVarLength)
	
	
Else 
	COPY ARRAY:C226(<>DIF_at_ProcessVarNames; $_ptr_ProcessVarNames->)
	COPY ARRAY:C226(<>DIF_at_ProcessVarTypes; $_ptr_ProcessVarTypes->)
	COPY ARRAY:C226(<>DIF_at_Process2Ds; $_Ptr_Process2Ds->)
	COPY ARRAY:C226(<>DIF_al_ProcessVarLength; $_Ptr_PVariableLengths->)
	
	
	
	
End if 

$_L_ref:=Find in array:C230($atMethodPaths; "Compiler_Variables_inter")
If ($_b_loadInterVarsDirectives)
	$_t_MethodText:=$_t_ComVarsInterMethodText
	$_l_Start:=1
	While (Match regex:C1019($_t_Pattern; $_t_MethodText; $_l_Start; $_l_Found; $_l_Length))
		$_t_MethodText:=Delete string:C232($_t_MethodText; $_l_Found; $_l_Length)
		$_l_Start:=$_l_Found
	End while 
	
	If ($_bo_SetText)
		$_ptr_HostCompilerDirIntervars->:=$_t_MethodText
	End if 
	$_l_Position:=Position:C15("C_"; $_t_MethodText)
	$_l_Position2:=Position:C15(("_o_"+"C_"); $_t_MethodText)
	If ($_l_Position2<$_l_Position) & ($_l_Position2>0)
		$_l_Position:=$_l_Position2
	End if 
	$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
	
	Repeat 
		$_l_Position:=Position:C15(Char:C90(13); $_t_MethodText)
		If ($_l_Position>0)
			$_t_ThisLine:=Substring:C12($_t_MethodText; 1; $_l_Position-1)
			$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position+1)
			
		Else 
			$_t_ThisLine:=$_t_MethodText
			$_t_MethodText:=""
			
		End if 
		If ($_t_ThisLine#"")
			$_l_Position:=Position:C15("//"; $_t_ThisLine)
			If ($_l_Position>0)
				$_t_ThisLine:=Substring:C12($_t_ThisLine; 1; $_l_Position-1)
			End if 
			If ($_t_ThisLine#"")
				$_t_Type:=""
				$_t_Length:=""
				Case of 
					: (Position:C15(("_o_"+"C_STRING"); $_t_ThisLine)>0)
						$_l_Position:=Position:C15("_o_"+"C_STRING"; $_t_ThisLine)
						If ($_l_Position>1)
							$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
						End if 
						$_t_ThisLine:=Replace string:C233($_t_ThisLine; ("_o_"+"C_STRING("); "")
						$_l_POsition:=Position:C15(";"; $_t_ThisLine)
						$_t_Length:=Substring:C12($_t_ThisLine; 1; $_l_POsition-1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_POsition+1)
						$_t_Type:="_o_"+"C_STRING"
					: (Position:C15("C_STRING"; $_t_ThisLine)>0)
						$_l_Position:=Position:C15("C_STRING"; $_t_ThisLine)
						If ($_l_Position>1)
							$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
						End if 
						$_t_ThisLine:=Replace string:C233($_t_ThisLine; "C_STRING("; "")
						$_l_POsition:=Position:C15(";"; $_t_ThisLine)
						$_t_Length:=Substring:C12($_t_ThisLine; 1; $_l_POsition-1)
						$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_POsition+1)
						$_t_Type:="C_STRING"
					: (Position:C15("C_TEXT"; $_t_ThisLine)>0)
						$_l_Position:=Position:C15("C_TEXT"; $_t_ThisLine)
						If ($_l_Position>1)
							$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
						End if 
						$_t_ThisLine:=Replace string:C233($_t_ThisLine; "C_TEXT("; "")
						$_t_Type:="C_TEXT"
					: (Position:C15("C_LONGINT"; $_t_ThisLine)>0)
						$_l_Position:=Position:C15("C_LONGINT"; $_t_ThisLine)
						If ($_l_Position>1)
							$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
						End if 
						$_t_ThisLine:=Replace string:C233($_t_ThisLine; "C_LONGINT("; "")
						
						$_t_Type:="C_LONGINT"
					: (Position:C15("C_REAL"; $_t_ThisLine)>0)
						$_l_Position:=Position:C15("C_REAL"; $_t_ThisLine)
						If ($_l_Position>1)
							$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
						End if 
						$_t_ThisLine:=Replace string:C233($_t_ThisLine; "C_REAL("; "")
						$_t_Type:="C_REAL"
					: (Position:C15(("_o_"+"C_INTEGER"); $_t_ThisLine)>0)
						$_l_Position:=Position:C15("_o_"+"C_INTEGER"; $_t_ThisLine)
						If ($_l_Position>1)
							$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
						End if 
						$_t_ThisLine:=Replace string:C233($_t_ThisLine; ("_o_"+"C_INTEGER("); "")
						$_t_Type:="_o_"+"C_INTEGER"
					: (Position:C15("C_INTEGER"; $_t_ThisLine)>0)
						$_l_Position:=Position:C15("C_INTEGER"; $_t_ThisLine)
						If ($_l_Position>1)
							$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
						End if 
						$_t_ThisLine:=Replace string:C233($_t_ThisLine; "C_INTEGER("; "")
						$_t_Type:="C_INTEGER"
					: (Position:C15("C_BOOLEAN"; $_t_ThisLine)>0)
						$_l_Position:=Position:C15("C_BOOLEAN"; $_t_ThisLine)
						If ($_l_Position>1)
							$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
						End if 
						$_t_ThisLine:=Replace string:C233($_t_ThisLine; "C_BOOLEAN("; "")
						$_t_Type:="C_BOOLEAN"
					: (Position:C15("C_OBJECT"; $_t_ThisLine)>0)
						$_l_Position:=Position:C15("C_OBJECT"; $_t_ThisLine)
						If ($_l_Position>1)
							$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
						End if 
						$_t_ThisLine:=Replace string:C233($_t_ThisLine; "C_OBJECT("; "")
						$_t_Type:="C_OBJECT"
					: (Position:C15("C_BLOB"; $_t_ThisLine)>0)
						$_l_Position:=Position:C15("C_BLOB"; $_t_ThisLine)
						If ($_l_Position>1)
							$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
						End if 
						$_t_ThisLine:=Replace string:C233($_t_ThisLine; "C_BLOB("; "")
						$_t_Type:="C_BLOB"
					: (Position:C15("C_TIME"; $_t_ThisLine)>0)
						$_l_Position:=Position:C15("C_TIME"; $_t_ThisLine)
						If ($_l_Position>1)
							$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
						End if 
						$_t_ThisLine:=Replace string:C233($_t_ThisLine; "C_TIME("; "")
						$_t_Type:="C_TIME"
					: (Position:C15("C_DATE"; $_t_ThisLine)>0)
						$_l_Position:=Position:C15("C_DATE"; $_t_ThisLine)
						If ($_l_Position>1)
							$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
						End if 
						$_t_ThisLine:=Replace string:C233($_t_ThisLine; "C_DATE("; "")
						$_t_Type:="C_DATE"
					: (Position:C15("C_PICTURE"; $_t_ThisLine)>0)
						$_l_Position:=Position:C15("C_PICTURE"; $_t_ThisLine)
						If ($_l_Position>1)
							
							$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
						End if 
						
						$_t_ThisLine:=Replace string:C233($_t_ThisLine; "C_PICTURE("; "")
						$_t_Type:="C_PICTURE"
					: (Position:C15("C_POINTER"; $_t_ThisLine)>0)
						$_l_Position:=Position:C15("C_POINTER"; $_t_ThisLine)
						If ($_l_Position>1)
							$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
						End if 
						$_t_ThisLine:=Replace string:C233($_t_ThisLine; "C_POINTER("; "")
						$_t_Type:="C_POINTER"
				End case 
				$_l_Position:=Position:C15(")"; $_t_ThisLine)
				$_t_VariableName:=Substring:C12($_t_ThisLine; 1; $_l_Position-1)
				$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position+1)
				APPEND TO ARRAY:C911($_ptr_GlobalVarNames->; $_t_VariableName)
				APPEND TO ARRAY:C911($_ptr_GobalVarTypes->; $_t_Type)
				APPEND TO ARRAY:C911($_Ptr_Global2Ds->; False:C215)
				APPEND TO ARRAY:C911($_Ptr_GVariableLengths->; Num:C11($_t_Length))
				
			End if 
		End if 
		
		
	Until ($_t_MethodText="")
	ARRAY TEXT:C222(<>DIF_at_GlobalVarNames; 0)
	ARRAY TEXT:C222(<>DIF_at_GlobalVarTypes; 0)
	ARRAY TEXT:C222(<>DIF_at_Global2Ds; 0)
	ARRAY LONGINT:C221(<>DIF_al_GlobalVarLength; 0)
	COPY ARRAY:C226($_ptr_GlobalVarNames->; <>DIF_at_GlobalVarNames)
	COPY ARRAY:C226($_ptr_GobalVarTypes->; <>DIF_at_GlobalVarTypes)
	COPY ARRAY:C226($_Ptr_Global2Ds->; <>DIF_at_Global2Ds)
	COPY ARRAY:C226($_Ptr_GVariableLengths->; <>DIF_al_GlobalVarLength)
Else 
	COPY ARRAY:C226(<>DIF_at_GlobalVarNames; $_ptr_GlobalVarNames->)
	COPY ARRAY:C226(<>DIF_at_GlobalVarTypes; $_ptr_GobalVarTypes->)
	COPY ARRAY:C226(<>DIF_at_Global2Ds; $_Ptr_Global2Ds->)
	COPY ARRAY:C226(<>DIF_al_GlobalVarLength; $_Ptr_GVariableLengths->)
	
End if 


C_BLOB:C604($_blb_Declarations)

SET BLOB SIZE:C606($_blb_Declarations; 0)
VARIABLE TO BLOB:C532($_ptr_GlobalVarNames->; $_blb_Declarations; *)
VARIABLE TO BLOB:C532($_ptr_GobalVarTypes->; $_blb_Declarations; *)
VARIABLE TO BLOB:C532($_Ptr_Global2Ds->; $_blb_Declarations; *)
VARIABLE TO BLOB:C532($_ptr_ProcessVarNames->; $_blb_Declarations; *)
VARIABLE TO BLOB:C532($_ptr_ProcessVarTypes->; $_blb_Declarations; *)
VARIABLE TO BLOB:C532($_Ptr_Process2Ds->; $_blb_Declarations; *)

VARIABLE TO BLOB:C532($_ptr_HostCompilerDirArrays->; $_blb_Declarations; *)
VARIABLE TO BLOB:C532($_ptr_HostCompilerDirInterArrays->; $_blb_Declarations; *)
VARIABLE TO BLOB:C532($_ptr_HostCompilerDirvars->; $_blb_Declarations; *)
VARIABLE TO BLOB:C532($_ptr_HostCompilerDirIntervars->; $_blb_Declarations; *)
VARIABLE TO BLOB:C532($_Ptr_GVariableLengths->; $_blb_Declarations; *)
VARIABLE TO BLOB:C532($_Ptr_PVariableLengths->; $_blb_Declarations; *)
CLEAR PASTEBOARD:C402
APPEND DATA TO PASTEBOARD:C403("4COD"; $_blb_Declarations)

//////////
