//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Check_MinorNC
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2010/01/14 2:48 PM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	C_BOOLEAN:C305($_bo_Query; $_bo_SearchSelection; $_bo_TypeSet; $8; AL_MINORFROMAL; vInModalWindow)
	C_LONGINT:C283($_l_CodeUse; $_l_CurrentWinRefOLD; $_l_FieldNumber; $_l_FieldType; $_l_Index; $_l_Left; $_l_OBottom; $_l_OLeft; $_l_ORight; $_l_OTop; $_l_TableNumber)
	C_LONGINT:C283($_l_Top; $_l_TypeSet; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowReference; $_l_WindowRight; $_l_windowTop; $10; $9; AL_l_Bottom; AL_l_Left)
	C_LONGINT:C283(AL_l_Right; AL_l_Top; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($_ptr_Variable; $1; $3; $4; $5)
	C_REAL:C285($_l_Bottom; $_l_Right)
	C_TEXT:C284($_t_Code; $_t_CurrentFormUsage; $_t_FirstChar; $_t_LastChar; $_t_oldMethodName; $_t_SearchText; $_t_SearchTextInput; $_t_TableName; $_t_VariableName; $_t_WindowTitle; $2)
	C_TEXT:C284($6; $7; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; DB_t_Methodname; SD_t_DiaryPersonName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_MinorNC")
DB_t_Methodname:=Current method name:C684
//Check_Minor No Creation




//Change $7 to read lots of ors if the parameter contains more than one
//& change Project_SelCU too
//skip search if false

If (Count parameters:C259>=8)
	$_bo_Query:=$8
Else 
	$_bo_Query:=True:C214
End if 
If (Count parameters:C259>=10)
	$_l_OLeft:=$9
	$_l_OTop:=$10
	$_l_ORight:=$_l_OLeft+1
	$_l_OBottom:=$_l_OTop+1
Else 
	
	RESOLVE POINTER:C394($1; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
	If (AL_MINORFROMAL) & (AL_l_Left>0) | (AL_l_Top>0)
		$_l_Left:=AL_l_Left
		$_l_Top:=AL_l_Top
		$_l_Right:=AL_l_Right
		$_l_Bottom:=AL_l_Bottom
		AL_MINORFROMAL:=False:C215
	Else 
		OBJECT GET COORDINATES:C663($1->; $_l_Left; $_l_Top; $_l_Right; $_l_Bottom)
	End if 
	
	
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	If ($_l_windowTop+$_l_Top<($_l_WindowBottom-200))
		$_l_OLeft:=$_l_WindowLeft+$_l_Left
		$_l_OTop:=$_l_windowTop+$_l_Top
		$_l_ORight:=$_l_WindowLeft+$_l_Left
		$_l_OBottom:=($_l_windowTop+$_l_Top)
		
		//$_l_WindowReference:=Open window($_l_WindowLeft+$_l_Left;$_l_windowTop+$_l_Top;($_l_WindowLeft+$_l_Left);($_l_windowTop+$_l_Top);-1986;$_t_WindowTitle;"Close_Cancel")
	Else 
		$_l_OLeft:=$_l_WindowLeft+$_l_Left
		$_l_OTop:=$_l_WindowBottom-200
		$_l_ORight:=$_l_WindowLeft+$_l_Left
		$_l_OBottom:=$_l_WindowBottom-200
		
		
		//$_l_WindowReference:=Open window($_l_WindowLeft+$_l_Left;$_l_WindowBottom-200;($_l_WindowLeft+$_l_Left);$_l_WindowBottom-200;-1986;$_t_WindowTitle;"Close_Cancel")
	End if 
	
	
End if 
If (GenValidatePointer($1)=False:C215)  //bug fix "=False" added 9/12/08 kmw v631b120l / v631b120h_3 ..... Added 9/12/08 -kmw v631b120k - This might be unlikely to be it but trying to stop any possible cause of Tim's crashing problem.
	//************ NOTE: 9/12/08 -kmw v631b120k -this is the same as oginal code that runs if $1 resolves to a blank value (see end of this method). It should make this a bit more robust in that it now checks for a null value in $1 before checking if its blank....if altered remember to change orinigal place as well ******
	UNLOAD RECORD:C212($3->)
	
	
	If ($_t_SearchText#"")
		$_ptr_Variable:=Get pointer:C304("v"+$2)
		If (Type:C295($_ptr_Variable->)=Is string var:K8:2) | (Type:C295($_ptr_Variable->)=Is text:K8:3) | (Type:C295($_ptr_Variable->)=Is alpha field:K8:1)  //NG MARCH 2004
			
			$_ptr_Variable->:=""
		End if 
		
	End if 
	//******************************************************************************************************************************************************************************************************************************************************************************************************************
Else 
	
	If (Is a variable:C294($1))
		$_t_SearchText:=$1->
	Else 
		If (Is field value Null:C964($1->))
			$_t_SearchText:=""
		Else 
			$_t_SearchText:=$1->
		End if 
	End if 
	
	If ($_t_SearchText#"")
		
		If ($_t_SearchText="in-selection@")
			$_bo_SearchSelection:=True:C214
			CREATE SET:C116($3->; "$Temp")
			
			$_t_SearchText:=Substring:C12($_t_SearchText; 13)
		End if 
		$_t_SearchTextInput:=$_t_SearchText
		$_t_SearchText:=Check_QM($_t_SearchText)
		
		$1->:=$_t_SearchText
		$_t_LastChar:=Substring:C12($_t_SearchText; Length:C16($_t_SearchText); 1)
		If (Count parameters:C259>6)
			$_l_CodeUse:=Num:C11($7)
		Else 
			$_l_CodeUse:=-1
		End if 
		If ($_l_CodeUse>=0)
			$_l_CodeUse:=Num:C11($7)
			
			$_t_Code:=String:C10(Table:C252($3))
			$_t_Code:=("0"*(3-Length:C16($_t_Code)))+$_t_Code+$_t_SearchText
			QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_Code; *)
			QUERY:C277([CODE_USES:91];  & ; [CODE_USES:91]Use:2=$_l_CodeUse)
			If ((Records in selection:C76([CODE_USES:91])=0) & (Character code:C91($_t_LastChar)#64))  //Search with @
				$_t_Code:=$_t_Code+"@"
				QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_Code; *)
				QUERY:C277([CODE_USES:91];  & ; [CODE_USES:91]Use:2=$_l_CodeUse)
			End if 
			If (Records in selection:C76([CODE_USES:91])=0)  //Search by Name
				If (Character code:C91($_t_LastChar)#64)
					$_t_Code:=$_t_SearchText+"@"
				Else 
					$_t_Code:=$_t_SearchText
				End if 
				If ($_bo_SearchSelection)
					USE SET:C118("$Temp")
					QUERY SELECTION:C341($3->; $5->=$_t_Code)
				Else 
					QUERY:C277($3->; $5->=$_t_Code)
				End if 
				If (Records in selection:C76($3->)>0)
					Project_SelCU($3; $4; $7)  //Link the records to Code Uses
				End if 
			End if 
			If (Records in selection:C76([CODE_USES:91])=0)
				REDUCE SELECTION:C351($3->; 0)
			Else 
				Join_SelCU($3; $4)
			End if 
			//NG Feb 2007 the following is needed because the JOBS table contains mulitple record types
			//we have therefore added to the system a CLASS on JOB TYPES
			If (Table:C252($3)=Table:C252(->[JOB_TYPES:65]))
				
				If (Count parameters:C259>=9)  //& (False)
					If ($9#0)
						CREATE SET:C116([JOB_TYPES:65]; "Temp1")
						CREATE EMPTY SET:C140([JOB_TYPES:65]; "Temp2")
						For ($_l_Index; 1; Records in selection:C76([JOB_TYPES:65]))
							$_bo_TypeSet:=[JOB_TYPES:65]TypeClass:12 ?? $9
							If ($_bo_TypeSet) | ([JOB_TYPES:65]TypeClass:12=0)
								ADD TO SET:C119([JOB_TYPES:65]; "Temp2")
							End if 
							NEXT RECORD:C51([JOB_TYPES:65])
						End for 
						USE SET:C118("Temp2")
						CLEAR SET:C117("Temp2")
						CLEAR SET:C117("Temp1")
					End if 
					
				End if 
			End if 
		Else 
			If ($_bo_Query)
				If ($_bo_SearchSelection)
					USE SET:C118("$Temp")
					QUERY SELECTION:C341($3->; $4->=$1->)
				Else 
					QUERY:C277($3->; $4->=$1->)
				End if 
			End if 
			
			If ((Records in selection:C76($3->)=0) & (Character code:C91($_t_LastChar)#64))
				$_t_Code:=$1->+"@"
				If ($_bo_SearchSelection)
					USE SET:C118("$Temp")
					QUERY SELECTION:C341($3->; $4->=$_t_Code)
				Else 
					QUERY:C277($3->; $4->=$_t_Code)
				End if 
				If (Records in selection:C76($3->)=0)
					If ($_bo_SearchSelection)
						USE SET:C118("$Temp")
						QUERY SELECTION:C341($3->; $5->=$_t_Code)
					Else 
						QUERY:C277($3->; $5->=$_t_Code)
					End if 
				End if 
			End if 
		End if 
		
		FilterOutSoftDeletions($3)
		//BSW 8/1/03 Steve reported that Diary_List showing deleted personals
		
		If (Count parameters:C259>5)
			If ($6#"")
				$_t_TableName:=$6
			Else 
				$_t_TableName:=$2
			End if 
		Else 
			$_t_TableName:=$2
		End if 
		If (Records in selection:C76($3->)>1)
			$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
			DB_t_CurrentFormUsage:="NC"
			If (Records in selection:C76($3->)>1)
				REDUCE SELECTION:C351($3->; 2500)
			End if 
			$_t_FirstChar:=Substring:C12($_t_TableName; 1; 1)
			
			$_t_WindowTitle:="Select a"+("n"*Num:C11(($_t_FirstChar="a") | ($_t_FirstChar="e") | ($_t_FirstChar="o") | ($_t_FirstChar="i") | ($_t_FirstChar="u")))+" "+$_t_TableName
			
			Array_LCx(Records in selection:C76($3->))
			GET FIELD PROPERTIES:C258($5; $_l_FieldType)
			
			If (($_l_FieldType=0) | ($_l_FieldType=2))
				SELECTION TO ARRAY:C260($4->; GEN_at_Identity; $5->; GEN_at_Name)
			Else 
				$_l_FieldType:=1
				FIRST RECORD:C50($3->)
				While (Not:C34(End selection:C36($3->)))
					GEN_at_Identity{$_l_FieldType}:=$4->
					GEN_at_Name{$_l_FieldType}:=String:C10($5->)
					$_l_FieldType:=$_l_FieldType+1
					NEXT RECORD:C51($3->)
				End while 
			End if 
			
			
			
			//TRACE
			If (($_l_OBottom-$_l_OTop)<195)
				$_l_OBottom:=$_l_OTop+195
			End if 
			If (($_l_ORight-$_l_OLeft)<195)
				$_l_ORight:=$_l_OLeft+195
			End if 
			$_l_WindowReference:=Open window:C153($_l_OLeft; $_l_OTop; $_l_ORight; $_l_OBottom; -1986; $_t_WindowTitle; "Close_Cancel")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			SET WINDOW RECT:C444($_l_OLeft; $_l_OTop; $_l_ORight; $_l_OBottom)
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			WIN_l_CurrentWinRef:=$_l_WindowReference
			
			If (vInModalWindow)  //added kmw 30/01/07
				HIDE WINDOW:C436(Current form window:C827)  //added kmw 30/01/07
			End if   //added kmw 30/01/07
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DIALOG:C40([COMPANIES:2]; "dRelate List")
			CLOSE WINDOW:C154
			WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
			If (vInModalWindow)  //added kmw 30/01/07
				SHOW WINDOW:C435(Current form window:C827)  //added kmw 30/01/07
			End if   //added kmw 30/01/07
			WS_KeepFocus
			
			If (OK=1)
				QUERY:C277($3->; $4->=GEN_at_Identity{GEN_at_Identity})
			Else 
				REDUCE SELECTION:C351($3->; 0)
			End if 
			Array_LCx(0)
			DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
			If ($4->="")
				GOTO OBJECT:C206($1->)
			End if 
		Else 
			If ($4->="")
				Gen_Alert("That "+$_t_TableName+" does not exist"+(", or is not applicable in this context"*(Num:C11(Count parameters:C259>6))); "Try again")
				GOTO OBJECT:C206($1->)
				//HIDE PROCESS(Current process)
				//  SHOW PROCESS(Current process)
				// BRING TO FRONT(Current process)
			End if 
		End if 
		If ($2#"")
			$_ptr_Variable:=Get pointer:C304("v"+$2)
			
			If (Type:C295($_ptr_Variable->)=Is string var:K8:2) | (Type:C295($_ptr_Variable->)=Is text:K8:3) | (Type:C295($_ptr_Variable->)=Is alpha field:K8:1)  //NG MARCH 2004
				$_ptr_Variable->:=$5->
			End if 
			SD_t_DiaryPersonName:=[PERSONNEL:11]Name:2
		End if 
		$1->:=$4->
	Else 
		UNLOAD RECORD:C212($3->)
		If ($2#"")
			$_ptr_Variable:=Get pointer:C304("v"+$2)
			If (Type:C295($_ptr_Variable->)=Is string var:K8:2) | (Type:C295($_ptr_Variable->)=Is text:K8:3) | (Type:C295($_ptr_Variable->)=Is alpha field:K8:1)  //NG MARCH 2004
				
				$_ptr_Variable->:=""
			End if 
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Check_MinorNC"; $_t_oldMethodName)
