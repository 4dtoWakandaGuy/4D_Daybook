If (False:C215)
	//object Name: [CUSTOM_FIELDS]dFurthFld.oFurth
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/11/2010 10:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CUS_lb_FurtherFields;0)
	//ARRAY BOOLEAN(INV_lb_InvoiceItems;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	C_BOOLEAN:C305(DB_bo_RecordModified; vAutoFind)
	C_LONGINT:C283($_l_Column; $_l_CurrentSortColumn; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; LB_l_ColumnNumber; LB_l_RowNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; $Lay; DB_t_CurrentFormUsage3; vT)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CUSTOM_FIELDS].dFurthFld.oFurth"; Form event code:C388)
$_l_event:=Form event code:C388
//If ($_l_event=On Data Change ) | ($_l_event=On Plug in Area )
Case of 
	: ($_l_event=On Header Click:K2:40)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		
		$_l_CurrentSortColumn:=LB_GetColumn(->INV_lb_InvoiceItems; ""; $_t_VariableName)
		
		//: (ALProEvt=1)  `Single click
	: ($_l_event=On Clicked:K2:4)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		LB_l_RowNumber:=$_l_Row
		
		LB_l_ColumnNumber:=LB_GetColumn(->CUS_lb_FurtherFields; $_t_VariableName)
		
		//$_l_Row:=AL_GetLine (eALFurth)
		
		If ($_l_Row>0)
			If (Length:C16(FUR_at_CustomFieldTypes{$_l_Row})=1)
				
				EDIT ITEM:C870(Self:C308->; $_l_Row)
				//  AL_SetScroll (eALFurth;$_l_Row;2)
			End if 
		End if 
		//: (ALProEvt=2)  `Double click
	: ($_l_event=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		LB_l_RowNumber:=$_l_Row
		
		LB_l_ColumnNumber:=LB_GetColumn(->CUS_lb_FurtherFields; $_t_VariableName)
		
		//$_l_Row:=AL_GetLine (eALFurth)
		
		If ($_l_Row>0)
			If (Length:C16(FUR_at_CustomFieldTypes{$_l_Row})=1)
				Case of 
					: ((FUR_at_CustomFieldTypes{$_l_Row}="T") & (vAutoFind))  //text field
						vT:=CUS_at_DisplayedData{$_l_Row}
						Text_Expand(->vT; FUR_at_CustomFieldNames{$_l_Row})
						If (OK=1)
							CUS_at_DisplayedData{$_l_Row}:=vT
							//AL_UpdateArrays (eALFurth;-1)
							DB_bo_RecordModified:=True:C214
						End if 
					: ((FUR_at_CustomFieldFormat{$_l_Row}="Pictures") & (vAutoFind))  //virtual Picture field
						If (CUS_at_DisplayedData{$_l_Row}="")
							CUS_at_DisplayedData{$_l_Row}:="@"
							$Lay:=DB_t_CurrentFormUsage3
							DB_t_CurrentFormUsage3:="FurthFld: "+FUR_at_CustomFieldNames{LB_l_RowNumber}
							Check_Minor(->CUS_at_DisplayedData{$_l_Row}; ""; ->[PICTURES:85]; ->[PICTURES:85]Picture_Code:1; ->[PICTURES:85]Picture_Name:2; "Pictures In"; "Picture")
							DB_t_CurrentFormUsage3:=$Lay
						Else 
							QUERY:C277([PICTURES:85]; [PICTURES:85]Picture_Code:1=CUS_at_DisplayedData{$_l_Row})
						End if 
						If (Records in selection:C76([PICTURES:85])>0)
							DBI_DisplayRecord(-Current process:C322; Table:C252(->[PICTURES:85]); ""; [PICTURES:85]Picture_Code:1)
							DB_bo_RecordModified:=True:C214
						End if 
						READ ONLY:C145([PICTURES:85])
					Else 
						
						EDIT ITEM:C870(Self:C308->; $_l_Row)
						//  AL_SetScroll (eALFurth;$_l_Row;2)
				End case 
			End if 
		End if 
		// : (ALProEvt=-3)  `Resized columns
		// : (ALProEvt=-4)  `Changed column lock
		// : (ALProEvt=-7)  `column dragged
		// : ((ALProEvt=-5) | (ALProEvt=-1))  `Sort button or Row dragged
	: (Form event code:C388=On Before Keystroke:K2:6)
		
		If (LB_l_ColumnNumber=2)
			If (Length:C16(FUR_at_CustomFieldTypes{LB_l_RowNumber})>1)
				
				GOTO OBJECT:C206(FUR_at_CustomFieldTypes)  // not sure if this is correct!
			End if 
		End if 
		
	: (Form event code:C388=On Data Change:K2:15)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Column:=LB_GetColumn(->CUS_lb_FurtherFields; $_t_VariableName)
		$_l_Row:=Self:C308->
		Furth_LBI_Mod(->CUS_lb_FurtherFields; $_l_Column; $_l_Row)
		//$0:=True
End case 
//End if
ERR_MethodTrackerReturn("OBJ:dFurthFld,CUS_lb_FurtherFields"; $_t_oldMethodName)
