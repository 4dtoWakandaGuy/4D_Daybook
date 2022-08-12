If (False:C215)
	//object Name: [PERSONNEL]Personnel_In.oAuth_userName2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/01/2014 13:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_AfterLength; $_l_BeforeLength; $_l_CharPosition; $_l_EndCharPosition; $_l_EndCharPositionOLD; $_l_event; $_l_Index; $_l_StartofKeepText; $_l_TakeOutLength; $_l_TextLength; DB_l_PasswordLock)
	C_LONGINT:C283(PER_l_end; PER_l_Start)
	C_TEXT:C284($_t_Keystroke; $_t_oldMethodName; $_t_PastedText; $_t_RetainAfter; $_t_StillAfter; $_t_StillBefore; $_t_UserPassword; PER_t_PasswordLockOLD; PER_t_UserPassword; PER_t_UserPasswordLOCK)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL]Personnel_In.oAuth_userName2"; Form event code:C388)


ERR_MethodTrackerReturn("OBJ Personnel_In.oAuth_userName2"; $_t_oldMethodName)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On After Edit:K2:43) | ($_l_event=On Getting Focus:K2:7) | ($_l_event=On Clicked:K2:4) | ($_l_event=On Data Change:K2:15) | ($_l_event=On After Keystroke:K2:26)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		$_t_UserPassword:=Get edited text:C655
		
		$_t_Keystroke:=Keystroke:C390
		
		If (Character code:C91($_t_Keystroke)#Backspace:K15:36)
			
			
			GET HIGHLIGHT:C209(Self:C308->; PER_l_Start; PER_l_end)
			If (PER_l_Start>1) & ($_t_Keystroke#"")
				If (Length:C16($_t_UserPassword)=(Length:C16(PER_t_UserPassword)+1))
					
					
					
					
					
					Case of 
						: (PER_l_Start=PER_l_end)
							$_l_CharPosition:=PER_l_Start-1
							If ($_l_CharPosition<Length:C16($_t_UserPassword))
								If (Length:C16(PER_t_UserPassword)<Length:C16($_t_UserPassword))
									
									
									
									
									//insert
									
									PER_t_UserPassword:=Substring:C12(PER_t_UserPassword; 1; $_l_CharPosition-1)+$_t_Keystroke+Substring:C12(PER_t_UserPassword; $_l_CharPosition)
									
									
									
									
								Else 
									//alter
									PER_t_UserPassword[[$_l_CharPosition]]:=$_t_Keystroke
									
									
									
								End if 
							Else 
								//append
								PER_t_UserPassword:=PER_t_UserPassword+$_t_Keystroke
								
								
								
								
							End if 
							
						: (PER_l_Start<PER_l_end)
							//TRACE
							
							$_l_CharPosition:=PER_l_Start-1
							$_l_EndCharPosition:=PER_l_end-1
							
							
					End case 
				Else 
					//TRACE
					
					
					
					$_t_StillBefore:=Substring:C12($_t_UserPassword; 1; PER_l_Start-(Length:C16($_t_Keystroke)+1))
					
					
					
					$_t_StillAfter:=Substring:C12($_t_UserPassword; PER_l_Start)
					
					
					$_l_StartofKeepText:=Length:C16(PER_t_UserPassword)-Length:C16($_t_StillAfter)
					PER_t_UserPassword:=(Substring:C12(PER_t_UserPassword; 1; Length:C16($_t_StillBefore)))+$_t_Keystroke+(Substring:C12(PER_t_UserPassword; $_l_StartofKeepText+1))
					
					
					
					
					
				End if 
			Else 
				//user pasted into field?
				
				
				If ($_t_UserPassword#PER_t_UserPasswordLOCK)
					
					//TRACE
					$_t_PastedText:=Get text from pasteboard:C524
					$_l_EndCharPositionOLD:=PER_l_Start-Length:C16($_t_PastedText)
					$_t_StillBefore:=Substring:C12($_t_UserPassword; 1; $_l_EndCharPositionOLD-1)
					$_t_RetainAfter:=Substring:C12($_t_UserPassword; PER_l_Start)
					
					
					$_l_TextLength:=Length:C16($_t_RetainAfter)
					$_t_RetainAfter:=Substring:C12(PER_t_UserPassword; (Length:C16(PER_t_UserPassword)+1)-$_l_TextLength)
					
					
					
					
					
					
					
					
					PER_t_UserPassword:=(Substring:C12(PER_t_UserPassword; 1; Length:C16($_t_StillBefore)))+$_t_PastedText+$_t_RetainAfter
					
					
					
					
					
					
				End if 
				
				
				
			End if 
			
		Else 
			
			GET HIGHLIGHT:C209(Self:C308->; PER_l_Start; PER_l_end)
			If (PER_l_Start>0)
				If (Length:C16($_t_UserPassword)=(Length:C16(PER_t_UserPassword)-1))
					
					
					
					Case of 
						: (PER_l_Start=PER_l_end)
							$_l_CharPosition:=PER_l_Start
							
							If ($_l_CharPosition<Length:C16($_t_UserPassword))
								If (Length:C16(PER_t_UserPassword)<Length:C16($_t_UserPassword))
									
									
									
									
									//take out of positon
									
									PER_t_UserPassword:=Substring:C12(PER_t_UserPassword; 1; $_l_CharPosition-2)+Substring:C12(PER_t_UserPassword; $_l_CharPosition)
									
									
									
								Else 
									//alter
									PER_t_UserPassword:=Substring:C12(PER_t_UserPassword; 1; $_l_CharPosition-1)+Substring:C12(PER_t_UserPassword; $_l_CharPosition+1)
									
									
									
									
									
									
								End if 
							Else 
								//append
								PER_t_UserPassword:=Substring:C12(PER_t_UserPassword; 1; Length:C16(PER_t_UserPassword)-1)
								
								
								
								
							End if 
							
						: (PER_l_Start<PER_l_end)
							$_l_CharPosition:=PER_l_Start-1
							$_l_EndCharPosition:=PER_l_end-1
							
							
					End case 
				Else 
					$_l_BeforeLength:=PER_l_Start
					$_l_AfterLength:=Length:C16($_t_UserPassword)-$_l_BeforeLength
					$_l_TakeOutLength:=Length:C16(PER_t_UserPassword)-Length:C16($_t_UserPassword)
					
					
					
					
					PER_t_UserPassword:=Substring:C12(PER_t_UserPassword; 1; $_l_BeforeLength-1)+Substring:C12(PER_t_UserPassword; $_l_BeforeLength+$_l_TakeOutLength)
					
					
					
					
				End if 
				
				
			End if 
		End if 
		DB_l_PasswordLock:=Length:C16(PER_t_UserPassword)
		PER_t_PasswordLockOLD:=PER_t_UserPassword
		
		
		
		For ($_l_Index; 1; Length:C16(PER_t_PasswordLockOLD))
			
			PER_t_PasswordLockOLD[[$_l_Index]]:="x"
		End for 
		POST OUTSIDE CALL:C329(Current process:C322)
		
	Else 
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL]Personnel_In.oAuth_userName2"; $_t_oldMethodName)
