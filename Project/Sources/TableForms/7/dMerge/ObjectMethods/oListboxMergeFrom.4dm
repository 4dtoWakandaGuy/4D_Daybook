If (False:C215)
	//object Method Name: Object Name:      [DOCUMENTS].dMerge.oListboxMergeFrom
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(LB_at_01_1;0)
	//ARRAY TEXT(LB_at_01_2;0)
	//ARRAY TEXT(LB_at_01_3;0)
	//ARRAY TEXT(LB_at_01_4;0)
	//ARRAY TEXT(LB_at_02_1;0)
	//ARRAY TEXT(LB_at_02_2;0)
	//ARRAY TEXT(LB_at_02_3;0)
	//ARRAY TEXT(LB_at_02_4;0)
	//ARRAY TEXT(LB_at_02_i3;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; bd25; bd27; eALOrdII; xOK)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; vCompCode; vTitle2)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].dMerge.oListboxMergeFrom"; Form event code:C388)
$_l_event:=Form event code:C388
RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
$_l_Row:=Self:C308->
//ALERT(String(ALProEvt))
Case of 
	: ($_l_event=On Double Clicked:K2:5)
		//bd27:=LBi_GetLine(eALContI)`NG TODO
		If (bd27>0)
			vCompCode:=LB_at_02_4{$_l_Row}
			READ WRITE:C146([CONTACTS:1])
			MESSAGES OFF:C175
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=LB_at_02_3{$_l_Row})
			MESSAGES ON:C181
			DIALOG:C40([CONTACTS:1]; "dSWContact")
			If (OK=1)
				LB_at_02_4{$_l_Row}:=vCompCode
				MESSAGES OFF:C175
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=vCompCode)
				MESSAGES ON:C181
				LB_at_02_2{$_l_Row}:=[COMPANIES:2]Company_Name:2
				If (LB_at_02_2{$_l_Row}="")
					LB_at_02_2{$_l_Row}:=[COMPANIES:2]Address_Line_one:3
				End if 
				//AL_UpdateArrays (eALContI;-2)
			End if 
		End if 
		
	: ($_l_event=On Drop:K2:12)
		//AL_GetDragLine (eALContI;bd25;bd26;bd27) NG TODO
		If ((bd27=eALOrdII) & (bd25>0))
			bd25:=0
			$_l_Row:=Find in array:C230(LB_at_02_3; LB_at_02_3{bd25})
			If ($_l_Row<1)
				$_l_Row:=Size of array:C274(LB_at_02_1)+1
				INSERT IN ARRAY:C227(LB_at_02_1; $_l_Row; 1)
				INSERT IN ARRAY:C227(LB_at_02_2; $_l_Row; 1)  //
				INSERT IN ARRAY:C227(LB_at_02_3; $_l_Row; 1)
				INSERT IN ARRAY:C227(LB_at_02_4; $_l_Row; 1)
				LB_at_02_1{$_l_Row}:=LB_at_01_1{bd25}
				LB_at_02_2{$_l_Row}:=LB_at_01_2{bd25}
				LB_at_02_3{$_l_Row}:=LB_at_01_3{bd25}
				LB_at_02_4{$_l_Row}:=LB_at_01_4{bd25}
				//AL_UpdateArrays (eALOrdII;-2)
				vTitle2:=String:C10($_l_Row)+" Contact"+("s"*(Num:C11($_l_Row#1)))+" to Merge ..."
				
				OBJECT SET ENABLED:C1123(xok; ($_l_Row>0))
				
				
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].dMerge.oListboxMergeFrom"; $_t_oldMethodName)
