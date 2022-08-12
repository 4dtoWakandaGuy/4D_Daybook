//%attributes = {}
If (False:C215)
	//Project Method Name:      StatsView_Cal1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/10/2010 14:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ST; 0)
	ARRAY DATE:C224($_ad_ST; 0)
	ARRAY INTEGER:C220($_ai_ST; 0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_2DFieldNumbers;0)
	ARRAY LONGINT:C221($_al_ST; 0)
	//ARRAY LONGINT(aSV2;0)
	ARRAY REAL:C219($_ar_ST; 0)
	//ARRAY TEXT(<>SYS_at_2DFieldNames;0)
	ARRAY TEXT:C222($_at_FieldValue; 0)
	ARRAY TEXT:C222($_at_ST; 0)
	//ARRAY TEXT(aSV1;0)
	//ARRAY TEXT(aSV5;0)
	//ARRAY TEXT(aSVN1;0)
	//ARRAY TEXT(DB_at_TableName;0)
	//ARRAY TEXT(SV_at_Field1Relation;0)
	//ARRAY TEXT(SV_at_FieldName1;0)
	//ARRAY TEXT(SV_at_FieldName3;0)
	//ARRAY TEXT(SV_at_FieldName4;0)
	C_BOOLEAN:C305($_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique)
	C_LONGINT:C283(<>PS_l_Progress; <>SYS_l_CancelProcess; $_l_arraySize; $_l_CurrentArrayElement; $_l_CurrentProcess; $_l_FieldLength; $_l_FieldNumberColumn; $_l_FieldType; $_l_TableNumberRow; bd12; bd13)
	C_LONGINT:C283(bd14; bd15; bd16; bd17; r1; r2; vSVT1; vSVT2)
	C_POINTER:C301($_ptr_FieldPointer; vFilePtr)
	C_REAL:C285(vSVT3; vSVT4)
	C_TEXT:C284($_t_oldMethodName; $_t_PreviousFIeldValue; $_t_ValueNowSTRING; vTitle20)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView_Cal1")
//StatsView Cal Col 1

Load_Fields

$_l_CurrentProcess:=Current process:C322
If (SV_at_Field1Relation{SV_at_FieldName1}="")
	OBJECT SET ENABLED:C1123(r1; False:C215)
	OBJECT SET ENABLED:C1123(r2; False:C215)
Else 
	If (bd13=1)  //Grey if x Chars
		r1:=1
		r2:=0
		OBJECT SET ENABLED:C1123(r1; False:C215)
		OBJECT SET ENABLED:C1123(r2; False:C215)
	Else 
		OBJECT SET ENABLED:C1123(r1; True:C214)
		OBJECT SET ENABLED:C1123(r2; True:C214)
	End if 
End if 

If (bd12=1)  //turn off the delay recalc
	bd12:=0
End if 

If (SV_at_FieldName1=0)
	SV_at_FieldName1:=1
End if 
If (SV_at_FieldName1=1)
	If ((DB_at_TableName#1) | (SV_at_FieldName3>1) | (SV_at_FieldName4>1))
		StatsView_Mess1("Analysing ...")
	End if 
	StatsView_Arr(1; 0)
	aSV1{1}:="All selected records"
	aSVN1{1}:="All selected records"
	If (DB_at_TableName=1)
		aSV2{1}:=Records in selection:C76(vFilePtr->)
	Else 
		
		<>PS_l_Progress:=0
		//INPUT FORM([FILES];"dProgress0")
		vTitle20:="Relating "+String:C10(Records in selection:C76(vFilePtr->))+" records"
		//DISPLAY RECORD([FILES])
		StatsView_Cal1C(1)
		<>PS_l_Progress:=5
		//INPUT FORM([FILES];"dProgress0")
		vTitle20:="Calculating ..."
		//DISPLAY RECORD([FILES])
	End if 
	vSVT1:=1
	vSVT2:=aSV2{1}
	vSVT3:=0
	vSVT4:=0
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
		StatsView_Mess2
	End if 
Else 
	StatsView_Mess1("Analysing ...")
	StatsView_Arr(0; 0)
	<>SYS_l_CancelProcess:=0
	If (SV_at_FieldName1{SV_at_FieldName1}="FF:@")
		StatsView_Cal1F
	Else 
		$_l_TableNumberRow:=Find in array:C230(<>DB_al_TableNums; SV_al_TableNumber{1})
		$_l_FieldNumberColumn:=Find in array:C230(<>SYS_at_2DFieldNames{$_l_TableNumberRow}; SV_at_FieldName1{SV_at_FieldName1})  //Find the Field No from the interProcess_Arrays
		If ($_l_FieldNumberColumn>0)
			$_ptr_FieldPointer:=Field:C253(SV_al_TableNumber{1}; <>SYS_al_2DFieldNumbers{$_l_TableNumberRow}{$_l_FieldNumberColumn})  //get a pointer to the field in column 1
			GET FIELD PROPERTIES:C258($_ptr_FieldPointer; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
			If (($_bo_FieldIndexed) & ($_l_FieldType=0))
				MESSAGES OFF:C175
				//BEEP
				
				DISTINCT VALUES:C339($_ptr_FieldPointer->; $_at_FieldValue)
				
				MESSAGES ON:C181
				bd15:=1
				bd17:=1
				<>PS_l_Progress:=1
				//`INPUT FORM([FILES];"dProgress0")
				//`DISPLAY RECORD([FILES])
			Else 
				ARRAY TEXT:C222($_at_FieldValue; 0)
				Case of 
					: ($_l_FieldType=0)
						ARRAY TEXT:C222($_at_ST; 0)
						SELECTION TO ARRAY:C260($_ptr_FieldPointer->; $_at_ST)
						SORT ARRAY:C229($_at_ST; >)
						$_l_arraySize:=Size of array:C274($_at_ST)
					: ($_l_FieldType=1)
						ARRAY REAL:C219($_ar_ST; 0)
						SELECTION TO ARRAY:C260($_ptr_FieldPointer->; $_ar_ST)
						SORT ARRAY:C229($_ar_ST; >)
						$_l_arraySize:=Size of array:C274($_ar_ST)
					: ($_l_FieldType=4)
						ARRAY DATE:C224($_ad_ST; 0)
						SELECTION TO ARRAY:C260($_ptr_FieldPointer->; $_ad_ST)
						SORT ARRAY:C229($_ad_ST; >)
						$_l_arraySize:=Size of array:C274($_ad_ST)
					: ($_l_FieldType=6)
						ARRAY BOOLEAN:C223($_abo_ST; 0)
						SELECTION TO ARRAY:C260($_ptr_FieldPointer->; $_abo_ST)
						SORT ARRAY:C229($_abo_ST; >)
						$_l_arraySize:=Size of array:C274($_abo_ST)
					: ($_l_FieldType=8)
						ARRAY INTEGER:C220($_ai_ST; 0)
						SELECTION TO ARRAY:C260($_ptr_FieldPointer->; $_ai_ST)
						SORT ARRAY:C229($_ai_ST; >)
						$_l_arraySize:=Size of array:C274($_ai_ST)
					: ($_l_FieldType=9)
						ARRAY LONGINT:C221($_al_ST; 0)
						SELECTION TO ARRAY:C260($_ptr_FieldPointer->; $_al_ST)
						SORT ARRAY:C229($_al_ST; >)
						$_l_arraySize:=Size of array:C274($_al_ST)
				End case 
				
				bd15:=1
				bd17:=1
				vTitle20:="Analysing 1 of "+String:C10($_l_arraySize)
				<>PS_l_Progress:=1
				//INPUT FORM([FILES];"dProgress0")
				//DISPLAY RECORD([FILES])
				
				$_t_PreviousFIeldValue:=""
				//$j:=0
				$_l_CurrentArrayElement:=1
				While (($_l_CurrentArrayElement<=$_l_arraySize) & (<>SYS_l_CancelProcess#$_l_CurrentProcess))
					IDLE:C311  // 7/04/03 pb
					bd15:=Int:C8(bd17+(($_l_CurrentArrayElement/$_l_arraySize)*(4-bd17)))
					If (bd15#bd16)
						bd16:=bd15
						<>PS_l_Progress:=bd15
						//INPUT FORM([FILES];"dProgress0")
						vTitle20:="Analysing "+String:C10($_l_CurrentArrayElement)+" of "+String:C10($_l_arraySize)
						//DISPLAY RECORD([FILES])
					End if 
					
					Case of 
						: ($_l_FieldType=0)
							$_t_ValueNowSTRING:=$_at_ST{$_l_CurrentArrayElement}
						: ($_l_FieldType=1)
							$_t_ValueNowSTRING:=String:C10($_ar_ST{$_l_CurrentArrayElement})
						: ($_l_FieldType=4)
							$_t_ValueNowSTRING:=String:C10($_ad_ST{$_l_CurrentArrayElement})
						: ($_l_FieldType=6)
							$_t_ValueNowSTRING:=("True"*Num:C11($_abo_ST{$_l_CurrentArrayElement}=True:C214))+("False"*Num:C11($_abo_ST{$_l_CurrentArrayElement}=False:C215))
						: ($_l_FieldType=8)
							$_t_ValueNowSTRING:=String:C10($_ai_ST{$_l_CurrentArrayElement})
						: ($_l_FieldType=9)
							$_t_ValueNowSTRING:=String:C10($_al_ST{$_l_CurrentArrayElement})
					End case 
					If ($_t_PreviousFIeldValue#$_t_ValueNowSTRING)
						$_t_PreviousFIeldValue:=$_t_ValueNowSTRING
						//$j:=$j+1
						//INSERT IN ARRAY($_at_FieldValue;$j;1)
						APPEND TO ARRAY:C911($_at_FieldValue; $_t_ValueNowSTRING)
					End if 
					$_l_CurrentArrayElement:=$_l_CurrentArrayElement+1
				End while 
				If (($_l_FieldType=0) | ($_l_FieldType=6))
					SORT ARRAY:C229($_at_FieldValue; >)
				End if 
				bd17:=bd17+3
			End if 
		Else 
			// ALERT("$_l_FieldNumberColumn=-1")
		End if 
		
		//x chars calcs - see also StatsView_Cal1F
		If ((bd13=1) & (bd14>0) & (Size of array:C274($_at_FieldValue)>1))
			vTitle20:="Analysing "+String:C10(bd14)+" Character"+("s"*(Num:C11(bd14>1)))
			//DISPLAY RECORD([FILES])
			$_at_FieldValue{1}:=Substring:C12($_at_FieldValue{1}; 1; bd14)
			$_at_FieldValue{1}:=$_at_FieldValue{1}+("@"*(Num:C11(Length:C16($_at_FieldValue{1})=bd14)))
			$_t_PreviousFIeldValue:=$_at_FieldValue{1}
			$_l_CurrentArrayElement:=2
			While (($_l_CurrentArrayElement<=Size of array:C274($_at_FieldValue)) & (<>SYS_l_CancelProcess#$_l_CurrentProcess))
				IDLE:C311  // 7/04/03 pb
				$_at_FieldValue{$_l_CurrentArrayElement}:=Substring:C12($_at_FieldValue{$_l_CurrentArrayElement}; 1; bd14)
				$_at_FieldValue{$_l_CurrentArrayElement}:=$_at_FieldValue{$_l_CurrentArrayElement}+("@"*(Num:C11(Length:C16($_at_FieldValue{$_l_CurrentArrayElement})=bd14)))
				If ($_t_PreviousFIeldValue=$_at_FieldValue{$_l_CurrentArrayElement})
					DELETE FROM ARRAY:C228($_at_FieldValue; $_l_CurrentArrayElement; 1)
				Else 
					$_t_PreviousFIeldValue:=$_at_FieldValue{$_l_CurrentArrayElement}
					$_l_CurrentArrayElement:=$_l_CurrentArrayElement+1
				End if 
			End while 
			
			bd15:=bd15+1
			bd16:=bd15
			<>PS_l_Progress:=bd15
			//INPUT FORM([FILES];"dProgress0")
			//DISPLAY RECORD([FILES])
			bd17:=bd17+1
		End if 
		
		vSVT2:=0
		vSVT3:=0
		vSVT4:=0
		$_l_arraySize:=Size of array:C274($_at_FieldValue)
		COPY NAMED SELECTION:C331(vFilePtr->; "$SelCal1")
		vTitle20:="Calculating 1 of "+String:C10($_l_arraySize)
		//DISPLAY RECORD([FILES])
		$_l_CurrentArrayElement:=1
		While (($_l_CurrentArrayElement<=$_l_arraySize) & (<>SYS_l_CancelProcess#$_l_CurrentProcess))
			IDLE:C311  // 7/04/03 pb
			bd15:=Int:C8(bd17+(($_l_CurrentArrayElement/$_l_arraySize)*(10-bd17)))
			If (bd15#bd16)
				bd16:=bd15
				<>PS_l_Progress:=bd15
				//INPUT FORM([FILES];"dProgress0")
				vTitle20:="Calculating "+String:C10($_l_CurrentArrayElement)+" of "+String:C10($_l_arraySize)
				//DISPLAY RECORD([FILES])
			End if 
			
			StatsView_Arr($_l_CurrentArrayElement; 1)
			aSV1{$_l_CurrentArrayElement}:=Substring:C12($_at_FieldValue{$_l_CurrentArrayElement}; 1; 79)
			
			//Find the right records
			USE NAMED SELECTION:C332("$SelCal1")
			StatsView_UpdS($_l_CurrentArrayElement; $_ptr_FieldPointer; $_l_FieldType)
			
			//Calc the Count column
			If (DB_at_TableName=1)
				aSV2{$_l_CurrentArrayElement}:=Records in selection:C76(vFilePtr->)
			Else 
				StatsView_Cal1C($_l_CurrentArrayElement)
			End if 
			vSVT2:=vSVT2+aSV2{$_l_CurrentArrayElement}
			
			//Calc columns 3 & 4
			If (SV_at_FieldName3>1)
				StatsView_Upd3($_l_CurrentArrayElement)
			End if 
			If (SV_at_FieldName4>1)
				StatsView_Upd4($_l_CurrentArrayElement)
			End if 
			
			$_l_CurrentArrayElement:=$_l_CurrentArrayElement+1
		End while 
		USE NAMED SELECTION:C332("$SelCal1")
		CLEAR NAMED SELECTION:C333("$SelCal1")
		
	End if   //end of if FF
	
	vSVT1:=Size of array:C274(aSV1)
	If (SV_at_FieldName3>1)
		StatsView_UpT3
	End if 
	If (SV_at_FieldName4>1)
		StatsView_UpT4
	End if 
	StatsView_Cal1N
	StatsView_Mess2
End if 
ARRAY TEXT:C222(aSV5; Size of array:C274(aSV2))
ERR_MethodTrackerReturn("StatsView_Cal1"; $_t_oldMethodName)