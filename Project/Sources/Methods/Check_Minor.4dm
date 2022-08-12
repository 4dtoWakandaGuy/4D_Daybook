//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_Minor
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:24
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Identity; 0)
	ARRAY TEXT:C222($_at_Name; 0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	C_BOOLEAN:C305(<>PER_bo_SystemSettingAccess; $_bo_BatchedEntry; $_bo_CreateRecord; LB_bo_MinorFromLB; DB_bo_ReadyForParameters; SD_bo_Contnue; vFromIn)
	C_LONGINT:C283($_l_AddMode; $_l_CallBackProcess; $_l_CurrentWinRefOLD; $_l_FieldNumber; $_l_Index; $_l_LineNumber; $_l_NewRecordTable; $_l_objectBottom; $_l_objectLeft; $_l_objectRight; $_l_objectTop)
	C_LONGINT:C283($_l_Process; $_l_Retries; $_l_TableNumber; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowReference; $_l_WindowRight; $_l_windowTop; $_t_CodeUse; AL_l_Bottom; AL_l_Left)
	C_LONGINT:C283(AL_l_Right; AL_l_Top; SD_l_ParentProcess; vAdd; vCM; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; xNext)
	C_POINTER:C301($_ptr_VariablePointer; $1; $3; $4; $5)
	C_TEXT:C284($_t_CharacterOne; $_t_CharacterOne2; $_t_CloseSave; $_t_Code; $_t_Context; $_t_CurrentFormUsage; $_t_CurrentInputForm; $_t_ExecuteMethodName; $_t_FIle; $_t_oldMethodName; $_t_SearchValue)
	C_TEXT:C284($_t_String; $_t_String1; $_t_String2; $_t_String3; $_t_String4; $_t_String5; $_t_TableName; $_t_VariableName; $_t_WindowTitle; $2; $6)
	C_TEXT:C284($7; $8; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentInputForm)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Check_Minor")


//Check_Minor
$_t_String:=$4->
If ($1->#"")
	//29/10/2009
	$_t_CloseSave:=DB_t_CallOnCloseorSave
	$1->:=Check_QM($1->)
	$_t_CharacterOne:=Substring:C12($1->; Length:C16($1->); 1)
	If (Count parameters:C259>7)
		$_t_CodeUse:=Num:C11($8)
		$_t_Code:=String:C10(Table:C252($3))
		$_t_Code:=("0"*(3-Length:C16($_t_Code)))+$_t_Code+$1->
		QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_Code; *)
		QUERY:C277([CODE_USES:91];  & ; [CODE_USES:91]Use:2=$_t_CodeUse)
		If ((Records in selection:C76([CODE_USES:91])=0) & (Character code:C91($_t_CharacterOne)#64))
			$_t_Code:=$_t_Code+"@"
			QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_Code; *)
			QUERY:C277([CODE_USES:91];  & ; [CODE_USES:91]Use:2=$_t_CodeUse)
		End if 
		If (Records in selection:C76([CODE_USES:91])=0)
			If (Character code:C91($_t_CharacterOne)#64)
				$_t_Code:=$1->+"@"
				
			Else 
				$_t_Code:=$1->
			End if 
			QUERY:C277($3->; $5->=$_t_Code)
			If (Records in selection:C76($3->)>0)
				Project_SelCU($3; $4; $8)
			End if 
		End if 
		If (Records in selection:C76([CODE_USES:91])=0)
			REDUCE SELECTION:C351($3->; 0)
		Else 
			Join_SelCU($3; $4)
		End if 
	Else 
		QUERY:C277($3->; $4->=$1->)
		If ((Records in selection:C76($3->)=0) & (Character code:C91($_t_CharacterOne)#64))
			$_t_Code:=$1->+"@"
			QUERY:C277($3->; $4->=$_t_Code)
			If (Records in selection:C76($3->)=0)
				QUERY:C277($3->; $5->=$_t_Code)
			End if 
		End if 
	End if 
	If (Count parameters:C259>6)
		If ($7#"")
			$_t_FIle:=$7
		Else 
			$_t_FIle:=$2
		End if 
	Else 
		$_t_FIle:=$2
	End if 
	OK:=1
	xNext:=0
	If (Records in selection:C76($3->)>1)
		$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
		If ((<>PER_bo_SystemSettingAccess=False:C215) & ($2#"Document"))
			
			DB_t_CurrentFormUsage:="NC"
			
		End if 
		If (Records in selection:C76($3->)>1)
			
			REDUCE SELECTION:C351($3->; 2500)
			
		End if 
		$_t_CharacterOne2:=Substring:C12($_t_FIle; 1; 1)
		
		
		$_t_WindowTitle:="Select a"+("n"*Num:C11(($_t_CharacterOne2="a") | ($_t_CharacterOne2="e") | ($_t_CharacterOne2="o") | ($_t_CharacterOne2="i") | ($_t_CharacterOne2="u")))+" "+$_t_FIle
		
		
		Array_LCx(0)
		ARRAY TEXT:C222($_at_Identity; 0)
		ARRAY TEXT:C222($_at_Name; 0)
		SELECTION TO ARRAY:C260($4->; $_at_Identity; $5->; $_at_Name)
		For ($_l_Index; 1; Size of array:C274($_at_Identity))
			
			APPEND TO ARRAY:C911(GEN_at_Identity; $_at_Identity{$_l_Index})
			
			APPEND TO ARRAY:C911(GEN_at_Name; $_at_Name{$_l_Index})
			
		End for 
		RESOLVE POINTER:C394($1; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		If (LB_bo_MinorFromLB)
			
			$_l_objectLeft:=AL_l_Left
			
			$_l_objectTop:=AL_l_Top
			
			$_l_objectRight:=AL_l_Right
			
			$_l_objectBottom:=AL_l_Bottom
			
			LB_bo_MinorFromLB:=False:C215
			
		Else 
			
			OBJECT GET COORDINATES:C663($1->; $_l_objectLeft; $_l_objectTop; $_l_objectRight; $_l_objectBottom)
			
		End if 
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		If ($_l_windowTop+$_l_objectTop<($_l_WindowBottom-200))
			
			$_l_WindowReference:=Open window:C153($_l_WindowLeft+$_l_objectLeft; $_l_windowTop+$_l_objectTop; ($_l_WindowLeft+$_l_objectLeft); ($_l_windowTop+$_l_objectTop); -1986; $_t_WindowTitle; "Close_Cancel")
			
		Else 
			
			$_l_WindowReference:=Open window:C153($_l_WindowLeft+$_l_objectLeft; $_l_WindowBottom-200; ($_l_WindowLeft+$_l_objectLeft); $_l_WindowBottom-200; -1986; $_t_WindowTitle; "Close_Cancel")
			
		End if 
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=$_l_WindowReference
		DIALOG:C40([COMPANIES:2]; "dRelate_List")
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
		WS_KeepFocus
		If ((OK=1) & (xNext=0))
			
			QUERY:C277($3->; $4->=GEN_at_Identity{GEN_at_Identity})
			
		Else 
			
			REDUCE SELECTION:C351($3->; 0)
			
		End if 
		Array_LCx(0)
		DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
	End if 
	$_l_LineNumber:=116
	
	$_t_String:=$4->
	
	If (($_t_String="") & (OK=1))
		If (xNext=0)
			
			If ((<>PER_bo_SystemSettingAccess) | ($2="Document"))
				
				Gen_Confirm("That "+$_t_FIle+" does not exist"+(", or is not applicable in this context"*(Num:C11(Count parameters:C259>7)))+". Do you want to create a new code?"; "Try again"; "Create it")
				
				WS_KeepFocus
				
			Else 
				
				Gen_Alert("That "+$_t_FIle+" does not exist"+(", or is not applicable in this context"*(Num:C11(Count parameters:C259>7))); "Try again")
				
				WS_KeepFocus
				
			End if 
			
		Else 
			
			OK:=0
			
		End if 
		If (OK=1)
			
			GOTO OBJECT:C206($1->)
			
			$4->:=""
			
		Else 
			
			$_t_SearchValue:=Uppers2($1->)
			
			If (Character code:C91(Substring:C12($_t_SearchValue; Length:C16($_t_SearchValue); 1))=64)
				
				$_t_SearchValue:=Substring:C12($_t_SearchValue; 1; Length:C16($_t_SearchValue)-1)
				
			End if 
			
			If (Character code:C91(Substring:C12($_t_SearchValue; Length:C16($_t_SearchValue); 1))=64)
				
				$_t_SearchValue:=Substring:C12($_t_SearchValue; 1; Length:C16($_t_SearchValue)-1)
				
			End if 
			
			//READ WRITE($3->)
			$_bo_CreateRecord:=False:C215
			If (Count parameters:C259>7)
				
				QUERY:C277($3->; $4->=$_t_SearchValue)
				
				If (Records in selection:C76($3->)=0)
					$_bo_CreateRecord:=True:C214
					//CREATE RECORD($3->)
					
					//$4->:=$_t_SearchValue
					
				Else 
					$_bo_CreateRecord:=True:C214
					//CREATE RECORD($3->)
					
				End if 
				
			Else 
				$_bo_CreateRecord:=True:C214
				//CREATE RECORD($3->)
				
				//$4->:=$_t_SearchValue
				
			End if 
			If (False:C215)
				//DB_SaveRecord ($3)
				
				$_l_AddMode:=vAdd
				
				vAdd:=1
				
				vCM:=1
				
				HIDE WINDOW:C436
				
				$_t_CurrentInputForm:=WIN_t_CurrentInputForm
				
				If (Count parameters:C259>5)
					
					If ($6="E:@")
						
						//$_t_oldMethodName2:=ERR_MethodTracker ("EXECUTE: "+Substring($6;3;17))
						$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace(Substring:C12($6; 3; 17))
						EXECUTE METHOD:C1007($_t_ExecuteMethodName)
						//EXECUTE FORMULA(Substring($6;3;17))
						
					Else 
						
						FORM SET INPUT:C55($3->; $6+"13")  //NG April 2004 removed reference to ◊screen
						
						WIN_t_CurrentInputForm:=$6+"13"
						
					End if 
					
				End if 
				
				Open_Pro_Window("Enter "+$_t_FIle; 0; 2; $3; WIN_t_CurrentInputForm)  //NG may 2004 added input form
				
				//DIALOG($3->;WIN_t_CurrentInputForm:=$6+"13")
				
				MODIFY RECORD:C57($3->; *)
				
				Close_ProWin(Table name:C256($3)+"_"+WIN_t_CurrentInputForm)  //NG may 2004 added input form name
				
				vCM:=0
				
				vAdd:=$_l_AddMode
				
				vFromIn:=False:C215
				
				WIN_t_CurrentInputForm:=$_t_CurrentInputForm
				
				SHOW WINDOW:C435
				
				If (OK=1)
					
					If (Count parameters:C259>7)
						
						$_t_Code:=String:C10(Table:C252($3))
						
						
						$_t_Code:=("0"*(3-Length:C16($_t_Code)))+$_t_Code+$4->
						
						QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_Code; *)
						
						QUERY:C277([CODE_USES:91];  & ; [CODE_USES:91]Use:2=$_t_CodeUse)
						
						If (Records in selection:C76([CODE_USES:91])=0)
							
							$1->:=""
							
							GOTO OBJECT:C206($1->)
							
						Else 
							
							$1->:=$4->
							
						End if 
						
					Else 
						
						$1->:=$4->
						
					End if 
					
					If ($1->#$4->)
						
						QUERY:C277($3->; $4->=$1->)
						
					End if 
					
				Else 
					
					$1->:=""
					
					GOTO OBJECT:C206($1->)
					
					DB_DeletionControl($3; "Check_Minor")
					
					DELETE RECORD:C58($3->)
					
				End if 
				
				READ ONLY:C145($3->)
				
				UNLOAD RECORD:C212($3->)
				$_t_String1:=$1->
				$_t_String2:=$4->
				If ($_t_String1#$_t_String2)
					
					QUERY:C277($3->; $4->=$1->)
					
				End if 
			Else 
				If ($_bo_CreateRecord)
					$_t_TableName:=Table name:C256($3)
					$_l_CallBackProcess:=Current process:C322
					$_bo_BatchedEntry:=False:C215
					$_t_Context:=""
					$_l_NewRecordTable:=Table:C252($3)
					CREATE EMPTY SET:C140($3->; "◊TempSet")
					$_l_Process:=New process:C317("DB_CreateNewRecord"; 256000; "Enter New "+$_t_TableName; -$_l_CallBackProcess; $_bo_BatchedEntry; $_l_NewRecordTable; True:C214; $_t_Context)
					$_l_Retries:=0
					Repeat 
						$_l_Retries:=$_l_Retries+1
						DelayTicks(2*(1+$_l_Retries))
					Until (DB_bo_ReadyForParameters)
					SET PROCESS VARIABLE:C370($_l_Process; SD_l_ParentProcess; SD_l_ParentProcess)
					SET PROCESS VARIABLE:C370($_l_Process; SD_bo_Contnue; True:C214)
					$_l_Retries:=0
					While (Process state:C330($_l_Process)>=0)
						$_l_Retries:=$_l_Retries+1
						DelayTicks(2*(1+$_l_Retries))
					End while 
					USE SET:C118("◊TempSet")
					CLEAR SET:C117("◊TempSet")
					
				End if 
			End if 
		End if 
	End if 
	
	If ($2#"")
		$_ptr_VariablePointer:=Get pointer:C304("v"+$2)
		If (Type:C295($_ptr_VariablePointer->)=Is string var:K8:2) | (Type:C295($_ptr_VariablePointer->)=Is text:K8:3) | (Type:C295($_ptr_VariablePointer->)=Is alpha field:K8:1)  //NG MARCH 2004
			$_t_String5:=$5->
			$_ptr_VariablePointer->:=$_t_String5
			
		End if 
	End if 
	$_t_String:=$4->
	$1->:=$_t_String
	DB_t_CallOnCloseorSave:=$_t_CloseSave
Else 
	If (Not:C34(Is a variable:C294($1)))
		
		
		RELATE ONE:C42($1->)
	End if 
	If ($2#"")
		$_ptr_VariablePointer:=Get pointer:C304("v"+$2)
		If (Type:C295($_ptr_VariablePointer->)=Is string var:K8:2) | (Type:C295($_ptr_VariablePointer->)=Is text:K8:3) | (Type:C295($_ptr_VariablePointer->)=Is alpha field:K8:1)  //NG MARCH 2004
			
			$_ptr_VariablePointer->:=""
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Check_Minor"; $_t_oldMethodName)