If (False:C215)
	//object Name: [LIST_LAYOUTS]Layout_In.Variable13
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2009 16:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_2DFieldNumbers;0)
	//ARRAY TEXT(<>DB_at_TableNames2;0)
	//ARRAY TEXT(<>SYS_at_CurrentTableFieldNames2;0)
	//ARRAY TEXT(AL_at_FormulaType;0)
	//ARRAY TEXT(AL_at_SubFieldNames;0)
	//ARRAY TEXT(LL_at_FieldName;0)
	//ARRAY TEXT(LL_at_FieldName2;0)
	//ARRAY TEXT(LL_at_TableNames2;0)
	C_LONGINT:C283($_l_event; $_l_FieldRow; $_l_TablePosition)
	C_TEXT:C284($_t_FormulaOLD; $_t_oldMethodName; AL_T_Formula; LL_t_FieldName; LL_t_FieldName2; LL_t_TableName2; vTitle13)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [LIST_LAYOUTS].Layout_In.Variable13"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		$_t_FormulaOLD:=Old:C35([LIST_LAYOUTS:96]Formula:9)
		Case of 
			: (AL_at_FormulaType=1)
				//field
				AL_at_FormulaType:=1
				ARRAY TEXT:C222(AL_at_SubFieldNames; 14)
				OBJECT SET VISIBLE:C603(AL_at_SubFieldNames; True:C214)
				OBJECT SET ENTERABLE:C238(AL_T_Formula; False:C215)
				OBJECT SET VISIBLE:C603(LL_at_TableNames2; False:C215)
				OBJECT SET VISIBLE:C603(LL_at_FieldName2; False:C215)
				OBJECT SET VISIBLE:C603(LL_t_TableName2; False:C215)
				OBJECT SET VISIBLE:C603(LL_t_FieldName2; False:C215)
				OBJECT SET VISIBLE:C603(LL_t_FieldName; False:C215)
				OBJECT SET VISIBLE:C603(LL_at_FieldName; False:C215)
				OBJECT SET VISIBLE:C603(*; "orelfieldLabel"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oReltableLabel"; False:C215)
				OBJECT SET VISIBLE:C603([LIST_LAYOUTS:96]X_Related_Field:16; False:C215)
				OBJECT SET VISIBLE:C603([LIST_LAYOUTS:96]X_Related_Table:15; False:C215)
				[LIST_LAYOUTS:96]X_Related_Field:16:=0
				[LIST_LAYOUTS:96]X_Related_Table:15:=0
				vTitle13:=Layouts_Type
				If ([LIST_LAYOUTS:96]Formula:9#"")
					If ([LIST_LAYOUTS:96]Formula:9[[1]]="•")
						//the current formula is a formula
						// clear it
						[LIST_LAYOUTS:96]Formula:9:=""
						AL_T_Formula:=""
					End if 
				End if 
				
				If ($_t_FormulaOLD#"")
					
					If ($_t_FormulaOLD#"•")
						
						//revert to previous save
						[LIST_LAYOUTS:96]Formula:9:=$_t_FormulaOLD
						AL_T_Formula:=[LIST_LAYOUTS:96]Formula:9
					End if 
				End if 
				
			: (AL_at_FormulaType=2)
				AL_at_FormulaType:=2
				OBJECT SET VISIBLE:C603(AL_at_SubFieldNames; False:C215)
				OBJECT SET ENTERABLE:C238(AL_T_Formula; True:C214)
				OBJECT SET VISIBLE:C603(LL_at_TableNames2; True:C214)
				OBJECT SET VISIBLE:C603(LL_t_TableName2; True:C214)
				OBJECT SET VISIBLE:C603(LL_t_FieldName2; True:C214)
				OBJECT SET VISIBLE:C603(LL_at_FieldName2; True:C214)
				//SET VISIBLE(LL_t_FieldName;True)
				//SET VISIBLE(LL_at_FieldName;True)
				OBJECT SET VISIBLE:C603([LIST_LAYOUTS:96]X_Related_Field:16; True:C214)
				OBJECT SET VISIBLE:C603([LIST_LAYOUTS:96]X_Related_Table:15; True:C214)
				OBJECT SET VISIBLE:C603(*; "orelfieldLabel"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oReltableLabel"; True:C214)
				vTitle13:="Subtable Formula "+"Enter formula in formula field"
				<>DB_at_TableNames2:=0
				[LIST_LAYOUTS:96]X_Related_Table:15:=0
				[LIST_LAYOUTS:96]X_Related_Field:16:=0
				<>SYS_at_CurrentTableFieldNames2:=0
				
				If ([LIST_LAYOUTS:96]Formula:9#"")
					If ([LIST_LAYOUTS:96]Formula:9[[1]]#"•")
						//it contains a field
						[LIST_LAYOUTS:96]Formula:9:=""
						AL_T_Formula:=""
						
					End if 
				End if 
				
				If ($_t_FormulaOLD#"")
					
					If ($_t_FormulaOLD="•")
						
						//revert to previous save
						[LIST_LAYOUTS:96]Formula:9:=$_t_FormulaOLD
						AL_T_Formula:=Substring:C12([LIST_LAYOUTS:96]Formula:9; 2; Length:C16([LIST_LAYOUTS:96]Formula:9))
						[LIST_LAYOUTS:96]X_Related_Field:16:=Old:C35([LIST_LAYOUTS:96]X_Related_Field:16)
						[LIST_LAYOUTS:96]X_Related_Table:15:=Old:C35([LIST_LAYOUTS:96]X_Related_Table:15)
						$_l_TablePosition:=Find in array:C230(<>DB_al_TableNums; [LIST_LAYOUTS:96]X_Related_Table:15)
						<>DB_at_TableNames2:=$_l_TablePosition
						$_l_FieldRow:=Find in array:C230(<>SYS_al_2DFieldNumbers{$_l_TablePosition}; [LIST_LAYOUTS:96]X_Related_Field:16)
						If ($_l_FieldRow>0)
							<>SYS_at_CurrentTableFieldNames2:=$_l_FieldRow
						Else 
							<>SYS_at_CurrentTableFieldNames2:=0
						End if 
						
					End if 
				End if 
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [LIST_LAYOUTS].Layout_In.Variable13"; $_t_oldMethodName)
