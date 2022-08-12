//%attributes = {"lang":"en","shared":true,"invisible":true}
If (False:C215)
	//-------------------- Method Set Up -------------------
	//Project Method Name:      CODE_GetCodeCompilerDIrectives
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
	ARRAY TEXT:C222($atMethodPaths; 0)
	C_BOOLEAN:C305(<>UNIT_b_UnitTesting)
	
	
	C_TEXT:C284(<>DIF_t_CompilerDirectives)
	//ARRAY TEXT(<>DIF_at_CompilerDirectives;0)
	//Array Text(<>DIF_at_VariableTypes;0)
	//ARRAY TEXT(<>DIF_at_Directive;0)
	
	C_LONGINT:C283($_L_CharIndex; $_l_Position; $_L_ref)
	C_POINTER:C301($_Ptr_DirectivesText; $_Ptr_VariablesNames; $_Ptr_VariablesTypes; $2; $3; $4)
	C_TEXT:C284($_T_MethodName; $_t_MethodNameTest; $_t_MethodText; $_t_ThisLine; $_t_Type; $_t_Varname; $1)
End if 
//---------- Reassign Passed Parameters OR get values ----------

If (Count parameters:C259>=4)
	If (False:C215)
		$_T_MethodName:=$1
		$_Ptr_VariablesNames:=$2
		$_Ptr_VariablesTypes:=$3
		$_Ptr_DirectivesText:=$4
	Else 
		$_T_MethodName:=$1
		ARRAY TEXT:C222($_At_VariableTypes; 0)
		ARRAY TEXT:C222($_at_VariableNames; 0)
		ARRAY BOOLEAN:C223($_abo_2DArray; 0)
		ARRAY LONGINT:C221($_aL_VariableLength; 0)
		C_TEXT:C284($_t_CodeDirectives)
		$_Ptr_VariablesNames:=->$_at_VariableNames
		$_Ptr_VariablesTypes:=->$_At_VariableTypes
		$_Ptr_DirectivesText:=->$_t_CodeDirectives
		$_Ptr_Lengths:=->$_aL_VariableLength
	End if 
	
Else 
	
	
	
End if 

//-------------------- Main Method -------------------
C_TEXT:C284(<>DIF_t_CompilerDirectives)
ARRAY TEXT:C222($atMethodPaths; 0)
METHOD GET PATHS:C1163(Path project method:K72:1; $atMethodPaths; *)
$_t_Pattern:="((?:\\/\\*(?:[^*]|(?:\\*+[^*\\/]))*\\*+\\/)|(?:\\/\\/.*))"

$_L_ref:=Find in array:C230($atMethodPaths; "Compiler_Methods")
If ($_L_ref>0)
	$_t_MethodText:=""
	METHOD GET CODE:C1190($atMethodPaths{$_L_ref}; $_t_MethodText; *)
	$_l_Start:=1
	While (Match regex:C1019($_t_Pattern; $_t_MethodText; $_l_Start; $_l_Found; $_l_Length))
		$_t_MethodText:=Delete string:C232($_t_MethodText; $_l_Found; $_l_Length)
		$_l_Start:=$_l_Found
	End while 
	If ($_t_MethodText#<>DIF_t_CompilerDirectives)  //I put the text if this into a var
		//on some databases the compiler directives is a large method and parsing it on every save is slow
		//but of course if it changes we want to reload
		ARRAY TEXT:C222(<>DIF_at_MethodNames; 0)
		ARRAY TEXT:C222(<>DIF_at_VariablesNames; 0; 0)
		ARRAY TEXT:C222(<>DIF_at_VariableTypes; 0; 0)
		ARRAY TEXT:C222(<>DIF_at_DirectivesText; 0)
		ARRAY LONGINT:C221(<>DIF_al_VarLength; 0; 0)
		<>DIF_t_CompilerDirectives:=$_t_MethodText
	End if 
	$_t_MethodText:=<>DIF_t_CompilerDirectives
	$_Ptr_DirectivesText->:=$_t_MethodText
	$_l_Position:=Position:C15("C_"; $_t_MethodText)
	$_l_Position2:=Position:C15(("_o_"+"C_"); $_t_MethodText)
	If ($_l_Position2<$_l_Position) & ($_l_Position2>0)
		$_l_Position:=$_l_Position2
	End if 
	$_t_MethodText:=Substring:C12($_t_MethodText; $_l_Position)
	
	$_l_Row:=Find in array:C230(<>DIF_at_MethodNames; $_T_MethodName)
	If ($_l_Row<0)
		APPEND TO ARRAY:C911(<>DIF_at_MethodNames; $_T_MethodName)
		INSERT IN ARRAY:C227(<>DIF_at_VariablesNames; Size of array:C274(<>DIF_at_VariablesNames)+1; 1)
		INSERT IN ARRAY:C227(<>DIF_at_VariableTypes; Size of array:C274(<>DIF_at_VariableTypes)+1; 1)
		INSERT IN ARRAY:C227(<>DIF_al_VarLength; Size of array:C274(<>DIF_al_VarLength)+1; 1)
		APPEND TO ARRAY:C911(<>DIF_at_DirectivesText; "")
		
		$_l_Row:=Size of array:C274(<>DIF_at_DirectivesText)
		//Else 
		
		
		$_l_POsition:=Position:C15($_T_MethodName; $_t_MethodText)
		If ($_l_POsition>0)
			If (<>DIF_at_DirectivesText{$_l_Row}="")  //this is just the text from the first ref to the method
				<>DIF_at_DirectivesText{$_l_Row}:=Substring:C12($_t_MethodText; $_l_POsition-1)
			End if 
			For ($_L_CharIndex; $_l_POsition; 1; -1)
				If ($_L_CharIndex>=0)
					If ($_t_MethodText[[$_L_CharIndex]]=Char:C90(13))
						$_t_MethodText:=Substring:C12($_t_MethodText; $_L_CharIndex+1)
						$_L_CharIndex:=0
					End if 
				End if 
				
			End for 
			
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
					If ($_t_ThisLine#("//"+$_T_MethodName))
						$_l_Position:=Position:C15("//"; $_t_ThisLine)
						If ($_l_Position>0)
							$_t_ThisLine:=Substring:C12($_t_ThisLine; 1; $_l_Position-1)
						End if 
						If ($_t_ThisLine#"")
							$_l_POsition:=Position:C15(("("+$_T_MethodName+" ;"); $_t_ThisLine)
							If ($_l_POsition>0)
								$_t_Type:=""
								$_t_LineLength:=""
								Case of 
									: (Position:C15("_o_"+"C_STRING"; $_t_ThisLine)>0)
										$_l_Position:=Position:C15("_o_"+"C_STRING"; $_t_ThisLine)
										If ($_l_Position>1)
											$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
										End if 
										$_t_ThisLine:=Replace string:C233($_t_ThisLine; "_o_"+"C_STRING("; "")
										$_l_POsition:=Position:C15(";"; $_t_ThisLine)
										$_t_LineLength:=Substring:C12($_t_ThisLine; 1; $_l_POsition-1)
										$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_POsition+1)
										$_t_Type:="_o_"+"C_STRING"
									: (Position:C15("C_STRING"; $_t_ThisLine)>0)
										$_l_Position:=Position:C15("C_STRING"; $_t_ThisLine)
										If ($_l_Position>1)
											$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
										End if 
										$_t_ThisLine:=Replace string:C233($_t_ThisLine; "C_STRING("; "")
										$_l_POsition:=Position:C15(";"; $_t_ThisLine)
										$_t_LineLength:=Substring:C12($_t_ThisLine; 1; $_l_POsition-1)
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
										$_l_Position:=Position:C15("C_TEXT"; $_t_ThisLine)
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
										$_t_ThisLine:=Replace string:C233($_t_ThisLine; "_o_"+"C_INTEGER("; "")
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
										$_t_ThisLine:=Replace string:C233($_t_ThisLine; "ARRAY OBJECT("; "")
										$_t_Type:="C_OBJECT"
									: (Position:C15("C_BLOB"; $_t_ThisLine)>0)
										$_l_Position:=Position:C15("C_BLOB"; $_t_ThisLine)
										If ($_l_Position>1)
											$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position)
										End if 
										$_t_ThisLine:=Replace string:C233($_t_ThisLine; "C_BLOB("; "")
										$_t_Type:="C_BLOB"
									: (Position:C15("C_TIME"; $_t_ThisLine)>0)
										$_l_Position:=Position:C15("C_ITIME"; $_t_ThisLine)
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
								$_l_Position:=Position:C15(";"; $_t_ThisLine)
								$_t_MethodNameTest:=Substring:C12($_t_ThisLine; 1; $_l_Position-1)
								$_t_ThisLine:=Substring:C12($_t_ThisLine; $_l_Position+1)
								$_l_Position:=Position:C15(")"; $_t_ThisLine)
								
								If ($_l_Position>0)
									$_t_Varname:=Substring:C12($_t_ThisLine; 1; $_l_Position-1)
									//If (Size of array($_Ptr_VariablesNames->{$_Row}=0)
									//Append to array($_Ptr_MethodParseText->;
									APPEND TO ARRAY:C911($_Ptr_VariablesNames->; $_t_Varname)
									APPEND TO ARRAY:C911($_Ptr_VariablesTypes->; $_t_Type)
									APPEND TO ARRAY:C911($_Ptr_Lengths->; Num:C11($_t_LineLength))
								End if 
							Else 
								$_t_MethodText:=""  //end of references to this method
							End if 
						End if 
					End if 
				End if 
				
				
			Until ($_t_MethodText="")
		End if 
		C_BLOB:C604($_blb_Directives)
		SET BLOB SIZE:C606($_blb_Directives; 0)
		//COPY ARRAY($_Ptr_DirectivesText->;<>DIF_at_DirectivesText{$_l_Row})
		COPY ARRAY:C226($_Ptr_VariablesTypes->; <>DIF_at_VariableTypes{$_l_Row})
		COPY ARRAY:C226($_Ptr_VariablesNames->; <>DIF_at_VariablesNames{$_L_Row})
		COPY ARRAY:C226($_Ptr_Lengths->; <>DIF_al_VarLength{$_l_Row})
		
		VARIABLE TO BLOB:C532($_Ptr_VariablesTypes->; $_blb_Directives; *)
		VARIABLE TO BLOB:C532($_Ptr_VariablesNames->; $_blb_Directives; *)
		VARIABLE TO BLOB:C532($_Ptr_DirectivesText->; $_blb_Directives; *)
		VARIABLE TO BLOB:C532($_Ptr_Lengths->; $_blb_Directives; *)
		CLEAR PASTEBOARD:C402
		APPEND DATA TO PASTEBOARD:C403("4COD"; $_blb_Directives)
	Else 
		C_BLOB:C604($_blb_Directives)
		SET BLOB SIZE:C606($_blb_Directives; 0)
		
		
		VARIABLE TO BLOB:C532(<>DIF_at_VariableTypes{$_l_Row}; $_blb_Directives; *)
		VARIABLE TO BLOB:C532(<>DIF_at_VariablesNames{$_l_Row}; $_blb_Directives; *)
		VARIABLE TO BLOB:C532(<>DIF_at_DirectivesText{$_l_Row}; $_blb_Directives; *)
		VARIABLE TO BLOB:C532(<>DIF_al_VarLength{$_l_Row}; $_blb_Directives; *)
		//CLEAR PASTEBOARD
		APPEND DATA TO PASTEBOARD:C403("4COD"; $_blb_Directives)
		//End if 
		$_t_MethodText:=<>DIF_at_DirectivesText{$_l_Row}
		
	End if 
	
End if 


