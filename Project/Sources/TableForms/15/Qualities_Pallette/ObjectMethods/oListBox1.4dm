If (False:C215)
	//object Name: [USER]Qualities_Pallette.oListBox1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(QV_abo_include;0)
	//ARRAY BOOLEAN(QV_LB_Items;0)
	//ARRAY LONGINT(QV_al_Levels;0)
	//ARRAY LONGINT(QV_al_QualityLevelLevels;0)
	//ARRAY LONGINT(QV_al_QualityQualityYears;0)
	//ARRAY LONGINT(QV_al_QualityYears;0)
	//ARRAY TEXT(QV_at_QualityYears;0)
	//ARRAY TEXT(QV_at_Values;0)
	C_BOOLEAN:C305($_bo_Set)
	C_LONGINT:C283($_l_Column; $_l_CurrentSortColumn; $_l_event; $_l_FieldNumber; $_l_LevelRow; $_l_Row; $_l_TableNumber; $_l_YearRow)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Qualities_Pallette.oListBox1"; Form event code:C388)
//MESSAGE(String(ALProEvt))
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Header Click:K2:40)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_CurrentSortColumn:=LB_GetColumn(->QV_LB_Items; ""; $_t_VariableName)
		
	: ($_l_event=On Clicked:K2:4)  //did user single-click on a line?
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_Column:=LB_GetColumn(->QV_LB_ITEMS; $_t_VariableName)
		
		Case of 
			: ($_l_Column=1) & ($_l_Row>0)
				If (QV_abo_include{$_l_Row}=False:C215)
					QV_abo_include{$_l_Row}:=True:C214
				End if 
				
		End case 
		//: ($2=11) | ($2=10) ` cell popup released
	: ($_l_event=On Data Change:K2:15)  // is that right?
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_Column:=LB_GetColumn(->QV_LB_ITEMS; $_t_VariableName)
		
		//$_l_Column:=AL_GetColumn (QV_l_Powerview)
		//$Line:=AL_GetLine (QV_l_Powerview)  `get the line the user selected
		Case of 
			: (($_l_Column=3) | ($_l_Column=4)) & ($_l_Row>0)
				$_bo_Set:=False:C215
				Case of 
					: ($_l_Column=3)
						$_l_LevelRow:=Find in array:C230(QV_al_Levels; QV_al_QualityLevelLevels{$_l_Row})
						If ($_l_YearRow<0)
							QV_al_QualityLevelLevels{$_l_Row}:=0
						Else 
							If (QV_al_QualityLevelLevels{$_l_Row}#0)
								$_bo_Set:=True:C214
							End if 
						End if 
						
					: ($_l_Column=4)
						$_l_YearRow:=Find in array:C230(QV_al_QualityYears; QV_al_QualityQualityYears{$_l_Row})
						If ($_l_YearRow<0)
							QV_al_QualityQualityYears{$_l_Row}:=0
						Else 
							If (QV_al_QualityQualityYears{$_l_Row}#0)
								$_bo_Set:=True:C214
							End if 
						End if 
						
				End case 
				
				If (QV_abo_include{$_l_Row}=False:C215) & ($_bo_Set=True:C214)
					QV_abo_include{$_l_Row}:=True:C214
				End if 
				
				
		End case 
		//AL_UpdateArrays (QV_l_Powerview;-2)
	Else 
		
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].Qualities_Pallette.oListBox1"; $_t_oldMethodName)
