//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StatsView Cal2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/11/2010 18:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(aSV2;0)
	//ARRAY LONGINT(SV_al_TableNumber;0)
	//ARRAY REAL(aSV3;0)
	//ARRAY REAL(aSV4;0)
	//ARRAY TEXT(<>SYS_at_2DFieldNames;0)
	//ARRAY TEXT(aSV1;0)
	//ARRAY TEXT(aSV5;0)
	//ARRAY TEXT(DB_at_TableName;0)
	//ARRAY TEXT(SV_at_FieldName1;0)
	//ARRAY TEXT(SV_at_FieldName3;0)
	//ARRAY TEXT(SV_at_FieldName4;0)
	C_LONGINT:C283(<>PS_l_Progress; <>SYS_l_CancelProcess; $_l_ArraySize; $_l_FIeldNumberColumn; $_l_FieldType; $_l_Index; $_l_TableNumberRow; bd12; bd15; bd16; bd17)
	C_LONGINT:C283(vSVT2)
	C_POINTER:C301($_ptr_FieldPointer; vFilePtr)
	C_REAL:C285(vSVT3; vSVT4)
	C_TEXT:C284($_t_oldMethodName; vTitle20)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView Cal2")
//StatsView Calc Col 2
Load_Fields

If (bd12=1)
	$_l_ArraySize:=Size of array:C274(aSV1)
	For ($_l_Index; 1; $_l_ArraySize)
		aSV2{$_l_Index}:=0
		aSV3{$_l_Index}:=0
		aSV4{$_l_Index}:=0
	End for 
	vSVT2:=0
	vSVT3:=0
	vSVT4:=0
Else 
	$_l_ArraySize:=Size of array:C274(aSV1)
	<>SYS_l_CancelProcess:=0
	If ($_l_ArraySize>0)
		vSVT2:=0
		vSVT3:=0
		vSVT4:=0
		If (aSV1{1}="All selected records")
			If ((DB_at_TableName#1) | (SV_at_FieldName3>1) | (SV_at_FieldName4>1))
				//StatsView_Mess1 ("Analysing ...")
			End if 
			If (DB_at_TableName=1)
				aSV2{1}:=Records in selection:C76(vFilePtr->)
			Else 
				<>PS_l_Progress:=1
				//INPUT FORM([FILES];"dProgress0")
				vTitle20:="Relating "+String:C10(Records in selection:C76(vFilePtr->))+" records"
				//DISPLAY RECORD([FILES])
				StatsView_Cal1C(1)
				<>PS_l_Progress:=5
				//INPUT FORM([FILES];"dProgress0")
				vTitle20:="Calculating ..."
				//DISPLAY RECORD([FILES])
			End if 
			vSVT2:=aSV2{1}
			If (SV_at_FieldName3>1)
				StatsView_Upd3(1)
				StatsView_UpT3
				<>PS_l_Progress:=7
				//INPUT FORM([FILES];"dProgress0")
				//DISPLAY RECORD([FILES])
			End if 
			If (SV_at_FieldName4>1)
				StatsView_Upd4(1)
				StatsView_UpT4
				<>PS_l_Progress:=9
				//INPUT FORM([FILES];"dProgress0")
				//DISPLAY RECORD([FILES])
			End if 
			If ((DB_at_TableName#1) | (SV_at_FieldName3>1) | (SV_at_FieldName4>1))
				<>PS_l_Progress:=10
				//INPUT FORM([FILES];"dProgress0")
				//DISPLAY RECORD([FILES])
				//StatsView_Mess2
			End if 
		Else 
			//StatsView_Mess1 ("Calculating 1 of "+String($_l_ArraySize))
			If (SV_at_FieldName1{SV_at_FieldName1}="FF:@")
				StatsView_Cal2F
			Else 
				$_l_TableNumberRow:=Find in array:C230(<>DB_al_TableNums; SV_al_TableNumber{1})
				$_l_FIeldNumberColumn:=Find in array:C230(<>SYS_at_2DFieldNames{$_l_TableNumberRow}; SV_at_FieldName1{SV_at_FieldName1})
				If ($_l_FIeldNumberColumn>0)
					$_ptr_FieldPointer:=Field:C253(SV_al_TableNumber{1}; $_l_FIeldNumberColumn)
					GET FIELD PROPERTIES:C258($_ptr_FieldPointer; $_l_FieldType)
					COPY NAMED SELECTION:C331(vFilePtr->; "$SelCal2")
					$_l_Index:=1
					While (($_l_Index<=$_l_ArraySize) & (<>SYS_l_CancelProcess#Current process:C322))
						IDLE:C311  // 7/04/03 pb
						bd15:=Int:C8(bd17+(($_l_Index/$_l_ArraySize)*(10-bd17)))
						If (bd15#bd16)
							bd16:=bd15
							<>PS_l_Progress:=bd15
							//INPUT FORM([FILES];"dProgress0")
							vTitle20:="Calculating "+String:C10($_l_Index)+" of "+String:C10($_l_ArraySize)
							//DISPLAY RECORD([FILES])
						End if 
						
						USE NAMED SELECTION:C332("$SelCal2")
						StatsView_UpdS($_l_Index; $_ptr_FieldPointer; $_l_FieldType)
						If (DB_at_TableName=1)
							aSV2{$_l_Index}:=Records in selection:C76(vFilePtr->)
						Else 
							StatsView_Cal1C($_l_Index)
						End if 
						vSVT2:=vSVT2+aSV2{$_l_Index}
						
						//Calc columns 3 & 4
						If (SV_at_FieldName3>1)
							StatsView_Upd3($_l_Index)
						End if 
						If (SV_at_FieldName4>1)
							StatsView_Upd4($_l_Index)
						End if 
						
						$_l_Index:=$_l_Index+1
					End while 
					USE NAMED SELECTION:C332("$SelCal2")
					CLEAR NAMED SELECTION:C333("$SelCal2")
					
				End if   //end of FF if
				
				If (SV_at_FieldName3>1)
					StatsView_UpT3
				End if 
				If (SV_at_FieldName4>1)
					StatsView_UpT4
				End if 
			End if 
			
			//StatsView_Mess2
			
		End if 
	End if 
End if 
StatsView_Learn
ARRAY TEXT:C222(aSV5; Size of array:C274(aSV4))
ERR_MethodTrackerReturn("StatsView Cal2"; $_t_oldMethodName)