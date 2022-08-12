//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_set_Designer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_new)
	C_LONGINT:C283($_l_CharacterPosition; $_l_CharPosition; $_l_Position)
	C_TEXT:C284(<>DB_t_CurrentDesigner; $_t_Insert; $_t_MethodText; $_t_oldMethodName; $_t_Substring; $1; DB_t_MethodText)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DB_set_Designer")



//TRACE


If (Count parameters:C259>=1)
	If ($1#"DB_Get_Designer")
		If (<>DB_t_CurrentDesigner="")
			Repeat 
				<>DB_t_CurrentDesigner:=Request:C163("Enter Designer Name"; "Nigel Greenlee")
			Until (<>DB_t_CurrentDesigner#"")
		End if 
		GET MACRO PARAMETER:C997(1; DB_t_MethodText)
		//ALERT(DB_t_MethodText)
		$_l_CharacterPosition:=Position:C15("ERR"; $1)  //dont insert this in error handler methods"
		If ($_l_CharacterPosition#1)  //
			$_l_CharacterPosition:=Position:C15("ERR_MethodTracker ("+Char:C90(34)+$1; DB_t_MethodText)
			If ($_l_CharacterPosition=0)
				$_l_CharPosition:=Position:C15("Form Method:"; $1)
				
				Case of 
					: ($_l_CharPosition>0)
						$_l_CharacterPosition:=Position:C15("ERR_MethodTracker (FM:"; DB_t_MethodText)
						If ($_l_CharacterPosition>0)
							DB_t_MethodText:=Replace string:C233(DB_t_MethodText; "ERR_MethodTracker (FM:"; "ERR_MethodTracker (Form Method:")
						Else 
							$_t_Insert:="$_t_oldMethodName:=ERR_MethodTracker ("+"DB_set_Designer"+";ForM event"+")"+Char:C90(13)
						End if 
					Else 
						$_l_CharPosition:=Position:C15("Form Method:"; $1)
						$_t_Insert:="$_t_oldMethodName:=ERR_MethodTracker ("+"DB_set_Designer"+")"+Char:C90(13)
				End case 
				DB_t_MethodText:=$_t_Insert+Char:C90(13)+DB_t_MethodText
			End if 
			$_l_CharacterPosition:=Position:C15("ERR_MethodTrackerReturn ("; DB_t_MethodText)
			If ($_l_CharacterPosition=0)
				DB_t_MethodText:=DB_t_MethodText+Char:C90(13)+"ERR_MethodTrackerReturn ("+"DB_set_Designer"+";$_t_oldMethodName)"
			End if 
		End if 
		$_bo_new:=False:C215
		$_l_CharacterPosition:=Position:C15(" ` Creator:"; DB_t_MethodText)
		If ($_l_CharacterPosition=0)
			$_bo_new:=True:C214
			// header does not exist
			$_t_Insert:="` ----------------------------------------------------"+Char:C90(13)
			$_t_Insert:=$_t_Insert+" ` Creator: "+<>DB_t_CurrentDesigner+Char:C90(13)
			$_t_Insert:=$_t_Insert+"`Date & time: "+String:C10(Current date:C33; System date short:K1:1)+" "+String:C10(Current time:C178; System time short:K7:9)
			$_t_Insert:=$_t_Insert+"`Method: "+$1
			$_t_Insert:=$_t_Insert+"`Description"+Char:C90(13)+Char:C90(13)
			$_t_Insert:=$_t_Insert+"`Parameters"+Char:C90(13)
			$_t_Insert:=$_t_Insert+"` ----------------------------------------------------"+Char:C90(13)
			$_t_Insert:=$_t_Insert+"`Project method Amendments"+Char:C90(13)+Char:C90(13)+""
			//Nigel Greenlee21/11/2009 13:59
			
			//Nigel Greenlee23/11/2009 21:02
			
			//Nigel Greenlee02/12/2009 17:45
			
			//Nigel Greenlee02/12/2009 17:54
			
			//Nigel Greenlee02/12/2009 17:54
			
			//Nigel Greenlee22/12/2010 01:53 v7.0.0/B45
			
			
			//End Project method Amendments")
			
			DB_t_MethodText:=$_t_Insert+Char:C90(13)+DB_t_MethodText
			
		End if 
		If (Not:C34($_bo_new))
			
			$_l_Position:=Position:C15("`End Project method Amendments"; DB_t_MethodText)
			$_t_Insert:="`"+<>DB_t_CurrentDesigner+String:C10(Current date:C33; System date short:K1:1)+" "+String:C10(Current time:C178; System time short:K7:9)
			If ($_l_Position=0)
				//add to the end of the method
				DB_t_MethodText:=DB_t_MethodText+Char:C90(13)+$_t_Insert
			Else 
				$_t_Substring:=Substring:C12(DB_t_MethodText; 1; $_l_Position-1)
				$_t_MethodText:=Substring:C12(DB_t_MethodText; $_l_Position; Length:C16(DB_t_MethodText))
				DB_t_MethodText:=$_t_Substring+Char:C90(13)+$_t_Insert+Char:C90(13)+$_t_MethodText
			End if 
		End if 
		SET MACRO PARAMETER:C998(1; DB_t_MethodText)
		
	End if 
End if 
ERR_MethodTrackerReturn("DB_set_Designer"; $_t_oldMethodName)