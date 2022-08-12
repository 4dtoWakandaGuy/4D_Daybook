//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_ITXPlay
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	C_BOOLEAN:C305($_bo_First)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_CharPosition; $_l_Count; $_l_CurrentProcess; $_l_Execute; $_l_FromPosition; $_l_NamedSelectionFound; $_l_Plus; $_l_SelectedRecordNumber; $_l_TableNumber; $_l_To)
	C_LONGINT:C283(vC)
	C_POINTER:C301($_ptr_table; $2; $3)
	C_TEXT:C284(<>QUOTE; $_l_MT; $_t_Execute; $_t_MT2; $_t_NamedSelection; $_t_oldMethodName; $_t_oldMethodName2; $_t_parameter1; $_t_parameter2; $_t_parameter3; $_t_parameter4)
	C_TEXT:C284($_t_TableName; $_t_Title2; $_t_Title3; $1; vDesc; vMTitle2; vMTitle3)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("IME_ITXPlay")

//IME_ITXPlay
Load_Fields

If (<>QUOTE="")
	<>Quote:=Char:C90(34)
End if 
If (Count parameters:C259<3)
	$_t_Title2:=vMTitle2
	$_t_Title3:=vMTitle3
Else 
	$_t_Title2:=$2->
	$_t_Title3:=$3->
End if 
$_l_CurrentProcess:=Current process:C322
$_l_CharPosition:=Position:C15("("; $_t_Title3)  //don't execute if can avoid it
If ($_l_CharPosition=0)
	IME_ReplyText2($1)
Else 
	$_t_parameter1:=First_Param($_t_Title2; ->$_t_Title2)
	
	$_bo_First:=True:C214
	$_l_Plus:=0
	If ($_t_parameter1=(Char:C90(34)+"Selection of @"))  //eg "Selection of Products", or "Selection of Products,"+viSearch+",1to10"
		$_t_parameter1:=Substring:C12($_t_parameter1; 15; Length:C16($_t_parameter1)-14)
		$_l_FromPosition:=Position:C15("&"; $_t_parameter1)
		If ($_l_FromPosition>0)
			$_l_Plus:=Length:C16(Substring:C12($_t_parameter1; $_l_FromPosition+1; 32000))
			$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+"vDesc:="+Char:C90(34)+Substring:C12($_t_parameter1; $_l_FromPosition; 32000))
			EXECUTE FORMULA:C63("vDesc:="+Char:C90(34)+Substring:C12($_t_parameter1; $_l_FromPosition; 32000))
			$_t_NamedSelection:=Substring:C12(vDesc; 2; 32000)  //named selection
			$_t_parameter1:=Substring:C12($_t_parameter1; 1; $_l_FromPosition-1)
			$_l_FromPosition:=Position:C15("&"; $_t_NamedSelection)
			If ($_l_FromPosition>0)
				$_t_parameter2:=Substring:C12($_t_NamedSelection; $_l_FromPosition+1; 32000)
				$_t_NamedSelection:=Substring:C12($_t_NamedSelection; 1; $_l_FromPosition-1)
				If ($_t_parameter2="First @")
					$_l_SelectedRecordNumber:=1
					$_l_Count:=Num:C11(Substring:C12($_t_parameter2; 7; 32000))
				Else 
					$_bo_First:=False:C215
					$_l_FromPosition:=Position:C15(" to "; $_t_parameter2)
					If ($_l_FromPosition>0)
						$_l_SelectedRecordNumber:=Num:C11(Substring:C12($_t_parameter2; 1; $_l_FromPosition-1))
						$_l_Count:=Num:C11(Substring:C12($_t_parameter2; $_l_FromPosition+4; 32000))
					Else 
						$_l_SelectedRecordNumber:=1
						$_l_Count:=10
					End if 
				End if 
			Else 
				$_l_SelectedRecordNumber:=1
				$_l_Count:=10
			End if 
		Else 
			$_t_NamedSelection:=""
		End if 
		
		$_t_parameter1:=RemoveQuote($_t_parameter1)
		$_t_parameter2:=RemoveQuote(First_Param($_t_Title2; ->$_t_Title2))
		If ($_t_parameter2="Execute:@")
			$_t_Execute:=Substring:C12($_t_parameter2; 9; Length:C16($_t_parameter2)-8)
			$_l_Execute:=1
		Else 
			$_t_Execute:=""
			$_l_Execute:=0
		End if 
		$_t_TableName:=$_t_parameter1
		
		$_l_TableNumber:=DB_GetTableNumFromNameString($_t_TableName)
		If ($_l_TableNumber>0)
			$_ptr_table:=Table:C252(<>DB_al_TableNums{$_l_TableNumber})
			vC:=1
			
			$_l_FromPosition:=$_l_CharPosition+Length:C16($_t_parameter1)+17+(11*$_l_Execute)+Length:C16($_t_Execute)+$_l_Plus
			$_l_To:=Length:C16($_t_Title3)-$_l_CharPosition-17-(11*$_l_Execute)-Length:C16($_t_Execute)-$_l_Plus
			$_t_Title2:="IME_ReplyText2 ("+<>Quote+$1+<>Quote+";"+STR_StringLiteral(Substring:C12($_t_Title3; $_l_FromPosition; $_l_To))
			
			If ($_t_NamedSelection#"")
				
				$_t_NamedSelection:="<>"+String:C10($_l_TableNumber)+"/"+$_t_NamedSelection
				
				$_l_NamedSelectionFound:=IME_ITXListNS($_t_NamedSelection)
				
				If ($_l_NamedSelectionFound>=0)
					
					$_bo_First:=($_l_NamedSelectionFound=1)
					
					If ($_bo_First)
						COPY NAMED SELECTION:C331($_ptr_table->; $_t_NamedSelection)
					Else 
						USE NAMED SELECTION:C332($_t_NamedSelection)
					End if 
					
					GOTO SELECTED RECORD:C245($_ptr_table->; $_l_SelectedRecordNumber)
					
					While ((Not:C34(End selection:C36($_ptr_table->))) & ($_l_SelectedRecordNumber<=$_l_Count) & (<>SYS_l_CancelProcess#$_l_CurrentProcess))
						If ($_l_Execute=1)
							$_l_MT:=$_t_Title2
							$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+$_t_Execute)
							EXECUTE FORMULA:C63($_t_Execute)
							$_t_Title2:=$_l_MT
						End if 
						$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+$_t_Title2)
						EXECUTE FORMULA:C63($_t_Title2)
						vC:=vC+1
						If ($_t_parameter1="Macros")
							USE NAMED SELECTION:C332($_t_NamedSelection)  //otherwise couldn't loop in a selection of Macros
						End if 
						$_l_SelectedRecordNumber:=$_l_SelectedRecordNumber+1
						NEXT RECORD:C51($_ptr_table->)  //GOTO SELECTED RECORD($_ptr_table»;$_l_SelectedRecordNumber)
					End while 
					
				End if 
				
			Else 
				If ($_t_parameter1="Macros")
					COPY NAMED SELECTION:C331($_ptr_table->; "mSel")
				End if 
				FIRST RECORD:C50($_ptr_table->)
				While ((Not:C34(End selection:C36($_ptr_table->))) & (<>SYS_l_CancelProcess#$_l_CurrentProcess))
					If ($_l_Execute=1)
						$_l_MT:=$_t_Title2
						$_t_MT2:=vMTitle2
						vMTitle2:=$_l_MT  //Just in case it is assumed in the execute
						$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+$_t_Execute)
						EXECUTE FORMULA:C63($_t_Execute)
						vMTitle2:=$_t_MT2
						$_t_Title2:=$_l_MT
					End if 
					$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+$_t_Title2)
					EXECUTE FORMULA:C63($_t_Title2)
					vC:=vC+1
					If ($_t_parameter1="Macros")
						USE NAMED SELECTION:C332("mSel")  //otherwise couldn't loop in a selection of Macros
						NEXT RECORD:C51($_ptr_table->)
						COPY NAMED SELECTION:C331($_ptr_table->; "mSel")
					Else 
						NEXT RECORD:C51($_ptr_table->)
					End if 
				End while 
				If ($_t_parameter1="Macros")
					CLEAR NAMED SELECTION:C333("mSel")
				End if 
			End if 
			
		Else 
			IME_Reply("<P>Incorrect File Name")
		End if 
		
	Else 
		$_t_parameter2:=Substring:C12($_t_Title3; $_l_CharPosition+1; Length:C16($_t_Title3)-$_l_CharPosition)
		If ((Character code:C91(Substring:C12($_t_parameter1; 1; 1))#34) | ($_t_parameter2="@+@"))  //ie if has any 4D proc, must execute
			$_l_MT:=$_t_Title2
			$_t_Title2:="IME_ReplyText2 ("+<>Quote+$1+<>Quote+";"+STR_StringLiteral($_t_parameter2)
			$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+$_t_Title2)
			EXECUTE FORMULA:C63($_t_Title2)
			$_t_Title2:=$_l_MT
		Else 
			If (Substring:C12($_t_Title2; Length:C16($_t_Title2)-1; 2)="()")
				IME_ReplyText2($1; STR_StringLiteral(STR_RemQuote($_t_parameter1)))
			Else 
				$_t_parameter2:=First_Param($_t_Title2)
				If ((Character code:C91(Substring:C12($_t_parameter2; 1; 1))#34) | ($_t_parameter1="@+@") | ($_t_parameter1="@[@") | ($_t_parameter1="@(@"))
					$_l_MT:=$_t_Title2
					$_t_Title2:="IME_ReplyText2 ("+<>Quote+$1+<>Quote+";"+STR_StringLiteral(Substring:C12($_t_Title3; $_l_CharPosition+1; Length:C16($_t_Title3)-$_l_CharPosition))
					$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+$_t_Title2)
					EXECUTE FORMULA:C63($_t_Title2)
					$_t_Title2:=$_l_MT
				Else 
					If (Substring:C12($_t_Title2; Length:C16($_t_Title2)-1; 2)="()")
						IME_ReplyText2($1; STR_StringLiteral(STR_RemQuote($_t_parameter1)); STR_StringLiteral(STR_RemQuote($_t_parameter2)))
					Else 
						$_t_parameter3:=First_Param($_t_Title2)
						If (Character code:C91(Substring:C12($_t_parameter3; 1; 1))#34)
							$_l_MT:=$_t_Title2
							$_t_Title2:="IME_ReplyText2 ("+<>Quote+$1+<>Quote+";"+STR_StringLiteral(Substring:C12($_t_Title3; $_l_CharPosition+1; Length:C16($_t_Title3)-$_l_CharPosition))
							$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+$_t_Title2)
							EXECUTE FORMULA:C63($_t_Title2)
							$_t_Title2:=$_l_MT
						Else 
							If (Substring:C12($_t_Title2; Length:C16($_t_Title2)-1; 2)="()")
								IME_ReplyText2($1; STR_StringLiteral(STR_RemQuote($_t_parameter1)); STR_StringLiteral(STR_RemQuote($_t_parameter2)); STR_StringLiteral(STR_RemQuote($_t_parameter3)))
							Else 
								$_t_parameter4:=First_Param($_t_Title2)
								If (Character code:C91(Substring:C12($_t_parameter4; 1; 1))#34)
									$_l_MT:=$_t_Title2
									$_t_Title2:="IME_ReplyText2 ("+<>Quote+$1+<>Quote+";"+STR_StringLiteral(Substring:C12($_t_Title3; $_l_CharPosition+1; Length:C16($_t_Title3)-$_l_CharPosition))
									$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+$_t_Title2)
									EXECUTE FORMULA:C63($_t_Title2)
									$_t_Title2:=$_l_MT
								Else 
									If (Substring:C12($_t_Title2; Length:C16($_t_Title2)-1; 2)="()")
										IME_ReplyText2($1; STR_StringLiteral(STR_RemQuote($_t_parameter1)); STR_StringLiteral(STR_RemQuote($_t_parameter2)); STR_StringLiteral(STR_RemQuote($_t_parameter3)); STR_StringLiteral(STR_RemQuote($_t_parameter4)))
									Else 
										$_l_MT:=$_t_Title2
										$_t_Title2:="IME_ReplyText2 ("+<>Quote+$1+<>Quote+";"+STR_StringLiteral(Substring:C12($_t_Title3; $_l_CharPosition+1; Length:C16($_t_Title3)-$_l_CharPosition))
										$_t_oldMethodName2:=ERR_MethodTracker("Execute: "+$_t_Title2)
										EXECUTE FORMULA:C63($_t_Title2)
										$_t_Title2:=$_l_MT
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
If (Count parameters:C259<3)
	vMTitle2:=$_t_Title2
	vMTitle3:=$_t_Title3
Else 
	$2->:=$_t_Title2
	$3->:=$_t_Title3
End if 
ERR_MethodTrackerReturn("IME_ITXPlay"; $_t_oldMethodName)