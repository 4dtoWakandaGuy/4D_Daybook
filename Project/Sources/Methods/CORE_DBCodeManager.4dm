//%attributes = {}
If (False:C215)
	//This method will manage the existance of a header on a method
	//it will also call code to keep track of the version of the code
	//and because it runs at start of the method will insert the handler for QA within the method itsel
	
End if 

//C_TEXT($1)
//C_LONGINT($1)
C_DATE:C307($_d_CurrentDate)
C_TIME:C306($_ti_ModificationTime; $_ti_ModificationTime)
ARRAY TEXT:C222($_at_ProjectFormMethods; 0)
C_BOOLEAN:C305($_bo_ValidateExistingHeader; $_bo_CodeisModified; $_bo_DoNotIgnore; $_Bo_ParseForm; $_bo_MethodEdited)
C_BOOLEAN:C305($_bo_IgnoreThismethod)
C_LONGINT:C283($_l_isthisaform)
C_LONGINT:C283($_l_Positionofwrapperstart; $_l_CurrentTimeLongInt; $_l_DevelopmentDays; $_l_FindMethodInArray; $_l_HeaderType; $_l_ModStamp; $_l_Position)
C_TIME:C306($_ti_ModificationTime)
C_DATE:C307($_Dte_ModificationDate; $_Dte_ModificationDate)
C_TEXT:C284($_Txt_MethodName; $1; $_t_addBack; $_t_CurrentMethodText; $_t_FormMethodPath; $_t_FormName; $_t_HeaderText; $_T_MethodGroupToIgnore)
C_LONGINT:C283($_l_MethodType; $2; $_l_ArraySize; $_l_CRPosition; $_l_PositionofErrorHandlerName; $_l_TestObject; $_l_WriteToArrayelemen)
C_TEXT:C284(<>CORE_t_CurrentDesigner; $_t_MethodText; $_t_ObjectName; $_t_StandardHeader)  //note that this method can only run in the uncompiled system
C_BOOLEAN:C305(<>CORE_bo_CurrentDesignerInited; $_Bo_ParseForm)
C_LONGINT:C283($_l_MaxCheck)
C_LONGINT:C283($_l_CheckInclude)
If (Not:C34(<>CORE_bo_CurrentDesignerInited))  //this only executes on the first edit of code in this session
	ARRAY TEXT:C222(<>CORE_at_IgnoreMethods; 0)
	//HERE PUT ADD TO THE ABOVE ARRAY METHODS OR METHOD PREFIXES YOU WANT IGNORED FROM INSERTION OF HEADER AND TRACKING.
	APPEND TO ARRAY:C911(<>CORE_at_IgnoreMethods; "CORE_*")
	APPEND TO ARRAY:C911(<>CORE_at_IgnoreMethods; "JUNK*")
	
	APPEND TO ARRAY:C911(<>CORE_at_IgnoreMethods; "COMPILER_*")
	APPEND TO ARRAY:C911(<>CORE_at_IgnoreMethods; "error*")
	APPEND TO ARRAY:C911(<>CORE_at_IgnoreMethods; "ERR_*")
	APPEND TO ARRAY:C911(<>CORE_at_IgnoreMethods; "AA_JUNK*")
	APPEND TO ARRAY:C911(<>CORE_at_IgnoreMethods; "DIFFu_*")
	APPEND TO ARRAY:C911(<>CORE_at_IgnoreMethods; "DB_FIXMETHODS2019*")
	
	ARRAY TEXT:C222(<>CODE_at_MethodHistory; 0)
	ARRAY TEXT:C222(<>CODE_at_MethodCode; 0)
	ARRAY BOOLEAN:C223(<>CODE_ab_MethodClean; 0)
	ARRAY TEXT:C222(<>CODE_at_MethodVersNotes; 0)
	ARRAY LONGINT:C221(<>CODE_al_MethodStamp; 0)
	ARRAY BOOLEAN:C223(<>CODE_ab_MethodReplace; 0)
	
	<>CORE_bo_CurrentDesignerInited:=True:C214
End if 
$_d_CurrentDate:=Current date:C33(*)
$_l_CurrentTimeLongInt:=Current time:C178(*)*1
$_l_DevelopmentDays:=$_d_CurrentDate-!2015-09-07!
$_ti_ModificationTime:=?00:00:00?
$_Dte_ModificationDate:=!00-00-00!
$_l_ModStamp:=$_l_CurrentTimeLongInt+$_l_DevelopmentDays

//TRACE
$_bo_CalledFromMacro:=False:C215
$_Txt_MethodName:=$1
$_T_MethodPath:=""  //only set if long name(path)
If (Count parameters:C259<2)
	GET MACRO PARAMETER:C997(1; $_t_MethodText)
	$_l_methodType:=-1
	$_Dte_ModificationDate:=Current date:C33
	$_ti_ModificationTime:=Current time:C178
	$_bo_CalledFromMacro:=True:C214
Else 
	//TRACE
	METHOD GET MODIFICATION DATE:C1170($_Txt_MethodName; $_Dte_ModificationDate; $_ti_ModificationTime)
	METHOD GET CODE:C1190($_Txt_MethodName; $_t_MethodText)
	$_l_methodType:=$2
	$_T_MethodPath:=$_Txt_MethodName
	$_t_MethodText:=CORE_DB_CodeExtractComment($_t_MethodText)
	$_Txt_MethodName:=CORE_DBGetMethodPath($_Txt_MethodName; ->$_l_MethodType)
End if 
$_bo_DoNotIgnore:=False:C215
If (Count parameters:C259>=3)
	$_bo_DoNotIgnore:=$3
End if 
If ($_t_MethodText#"") | (Count parameters:C259=1)
	$_t_ObjectName:=CORE_DBCodeBuildTitle($_Txt_MethodName; ->$_l_MethodType; ->$_Bo_ParseForm)
	
	
	ARRAY TEXT:C222($_At_GVariableTypes; 0)
	ARRAY TEXT:C222($_at_GVariableNames; 0)
	ARRAY BOOLEAN:C223($_abo_G2DArray; 0)
	ARRAY TEXT:C222($_At_pVariableTypes; 0)
	ARRAY TEXT:C222($_at_pVariableNames; 0)
	ARRAY BOOLEAN:C223($_abo_p2DArray; 0)
	ARRAY BOOLEAN:C223(DB_abo_p2DArray; 0)
	C_TEXT:C284($_t_HostCompilerDirArrays; $_T_HostCompilerDirIntArrays; $_t_HostCompilerDirvars; $_t_HostCompilerDirIntervars)
	ARRAY TEXT:C222($_At_VariableTypes; 0)
	C_BOOLEAN:C305(DB_abo_VarnamesInited)
	If (Not:C34(DB_abo_VarnamesInited))
		CODE_GetCompilerDirectives(->$_at_GVariableNames; ->$_At_GVariableTypes; ->$_abo_G2DArray; ->$_at_pVariableNames; ->$_At_pVariableTypes; ->$_abo_p2DArray; ->$_t_HostCompilerDirArrays; ->$_T_HostCompilerDirIntArrays; ->$_t_HostCompilerDirvars; ->$_t_HostCompilerDirIntervars)
		
		
		ARRAY TEXT:C222(DB_at_GVariableNames; 0)
		ARRAY TEXT:C222(DB_At_GVariableTypes; 0)
		
		ARRAY BOOLEAN:C223(DB_abo_G2DArray; 0)
		ARRAY TEXT:C222(DB_At_pVariableTypes; 0)
		ARRAY TEXT:C222(DB_at_pVariableNames; 0)
		ARRAY BOOLEAN:C223(DB_abo_p2DArray; 0)
		ARRAY BOOLEAN:C223(DB_abo_p2DArray; 0)
		COPY ARRAY:C226($_at_GVariableNames; DB_at_GVariableNames)
		COPY ARRAY:C226($_At_GVariableTypes; DB_At_GVariableTypes)
		COPY ARRAY:C226($_abo_G2DArray; DB_abo_G2DArray)
		COPY ARRAY:C226($_at_pVariableNames; DB_At_pVariableNames)
		COPY ARRAY:C226($_At_pVariableTypes; DB_At_pVariableTypes)
		COPY ARRAY:C226($_abo_p2DArray; DB_abo_p2DArray)
		DB_t_HostCompilerDirArrays:=$_t_HostCompilerDirArrays
		DB_T_HostCompilerDirIntArrays:=$_T_HostCompilerDirIntArrays
		DB_t_HostCompilerDirvars:=$_t_HostCompilerDirvars
		DB_t_HostCompilerDirIntervars:=$_t_HostCompilerDirIntervars
		DB_abo_VarnamesInited:=True:C214
	Else 
		COPY ARRAY:C226(DB_at_GVariableNames; $_at_GVariableNames)
		COPY ARRAY:C226(DB_At_GVariableTypes; $_At_GVariableTypes)
		COPY ARRAY:C226(DB_abo_G2DArray; $_abo_G2DArray)
		COPY ARRAY:C226(DB_at_pVariableNames; $_At_pVariableNames)
		COPY ARRAY:C226(DB_At_pVariableTypes; $_At_pVariableTypes)
		COPY ARRAY:C226(DB_abo_p2DArray; $_abo_p2DArray)
		$_t_HostCompilerDirArrays:=DB_t_HostCompilerDirArrays
		$_T_HostCompilerDirIntArrays:=DB_T_HostCompilerDirIntArrays
		$_t_HostCompilerDirvars:=DB_t_HostCompilerDirvars
		$_t_HostCompilerDirIntervars:=DB_t_HostCompilerDirIntervars
		
	End if 
	ARRAY TEXT:C222($_At_VariableTypes; 0)
	ARRAY TEXT:C222($_at_VariableNames; 0)
	ARRAY BOOLEAN:C223($_abo_2DArray; 0)
	C_TEXT:C284($_t_CodeDirectives)
	CODE_GetCodeCompilerDIrectives($_Txt_MethodName; ->$_at_VariableNames; ->$_At_VariableTypes; ->$_t_CodeDirectives)
	
	$_t_MethodTextOLD:=$_t_MethodText
	If ($_bo_CalledFromMacro)
		If ($_l_MethodType>0)
			$_l_MethodType:=-($_l_MethodType)
		End if 
	End if 
	$_t_MethodComments:=""
	If (Position:C15("Compile"; $_Txt_MethodName)>0)
		//TRACE
	End if 
	If (UTIL_isComponentInstalled("DIFFComponent")) | (UTIL_isComponentInstalled("DIFF"))
		If ($_T_MethodPath#"")
			
			EXECUTE FORMULA:C63("DIFF_CODEMANAGER($_T_MethodPath;$_l_MethodType;->$_t_MethodText;$_bo_DoNotIgnore;$_t_HostCompilerDirArrays;$_T_HostCompilerDirIntArrays;$_t_HostCompilerDirvars;$_t_HostCompilerDirIntervars;$_t_CodeDirectives;$_Dte_ModificationDate;$_ti_ModificationTim"+"e;->$_t_MethodComments)")
			
		Else 
			EXECUTE FORMULA:C63("DIFF_CODEMANAGER($_Txt_MethodName;$_l_MethodType;->$_t_MethodText;$_bo_DoNotIgnore;$_t_HostCompilerDirArrays;$_T_HostCompilerDirIntArrays;$_t_HostCompilerDirvars;$_t_HostCompilerDirIntervars;$_t_CodeDirectives;$_Dte_ModificationDate;$_ti_ModificationT"+"ime;->$_t_MethodComments)")
			
		End if 
	End if 
	If ($_t_MethodText#"")
		If ($_t_MethodText#$_t_MethodTextOLD)
			$_l_MaxCheck:=Size of array:C274(<>CORE_at_IgnoreMethods)
			For ($_l_CheckInclude; 1; $_l_MaxCheck)  //check we dont want to ignore this method from our management-basically this method itself and and scratch methods.
				If (Position:C15("*"; <>CORE_at_IgnoreMethods{$_l_CheckInclude})>0)
					$_T_MethodGroupToIgnore:=Replace string:C233(<>CORE_at_IgnoreMethods{$_l_CheckInclude}; "*"; "")
					$_bo_IgnoreThismethod:=(Position:C15($_T_MethodGroupToIgnore; $_Txt_MethodName)=1)
				Else 
					$_bo_IgnoreThismethod:=(<>CORE_at_IgnoreMethods{$_l_CheckInclude}=$_Txt_MethodName)
				End if 
				If ($_bo_IgnoreThismethod)
					$_l_CheckInclude:=$_l_MaxCheck
				End if 
				
			End for 
			If (Not:C34($_bo_IgnoreThismethod)) | ($_bo_DoNotIgnore)
				
				If (Count parameters:C259<2)
					SET MACRO PARAMETER:C998(Full method text:K5:17; $_t_MethodText)
					
				Else 
					
					METHOD SET CODE:C1194($1; $_t_MethodText)
					
				End if 
			End if 
			
			
		End if 
	End if 
End if 