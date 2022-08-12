//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Check Postcode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_FirstWord; $_t_FirstWord2; $_t_Format; $_t_Format2; $_t_Format3; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check Postcode")

$0:=True:C214
If ($1#"")
	$_t_FirstWord:=FirstWord($1)
	$1:=Substring:C12($1; Length:C16($_t_FirstWord)+2; 21)
	$_t_FirstWord2:=FirstWord($1)
	If (($_t_FirstWord2#"") & (Length:C16($1)>Length:C16($_t_FirstWord2)))
		$0:=False:C215
		If (Count parameters:C259=2)
			$2->:="N"
		End if 
	Else 
		$_t_Format:=Check_PC_AN($_t_FirstWord)
		If (($_t_Format#"AN") & ($_t_Format#"AAN") & ($_t_Format#"ANN") & ($_t_Format#"AANN") & ($_t_Format#"AANN") & ($_t_Format#"ANA") & ($_t_Format#"AANA") & ($_t_Format#"AAA") & ($_t_Format#"AAAA"))
			$0:=False:C215
			If (Count parameters:C259=2)
				$2->:="N"
			End if 
		Else 
			
			If ($0)
				If (($_t_FirstWord="Q@") | ($_t_FirstWord="V@") | ($_t_FirstWord="X@") | ($_t_FirstWord="@J@"))
					$0:=False:C215
					If (Count parameters:C259=2)
						$2->:="N"
					End if 
				Else 
					
					If (($_t_Format="AAAA") & ($_t_FirstWord#"BFPO"))
						$0:=False:C215
						If (Count parameters:C259=2)
							$2->:="N"
						End if 
					Else 
						
						$_t_Format2:=Substring:C12($_t_FirstWord; 2; 1)
						If (($_t_Format2="Z") | (($_t_Format2="I") & ($_t_FirstWord#"GIR")))
							$0:=False:C215
							If (Count parameters:C259=2)
								$2->:="N"
							End if 
						Else 
							
							If (Length:C16($_t_Format)>2)
								If ((Substring:C12($_t_Format; 3; 1))="A")
									$_t_Format2:=Substring:C12($_t_FirstWord; 3; 1)
									If (($_t_Format2#"A") & ($_t_Format2#"E") & ($_t_Format2#"H") & ($_t_Format2#"M") & ($_t_Format2#"N") & ($_t_Format2#"P") & ($_t_Format2#"R") & ($_t_Format2#"T") & ($_t_Format2#"V") & ($_t_Format2#"X") & ($_t_Format2#"Y"))
										$0:=False:C215
										If (Count parameters:C259=2)
											$2->:="N"
										End if 
									End if 
								End if 
							End if 
							
							If ($0)
								
								If (Length:C16($_t_Format)>3)
									If ((Substring:C12($_t_Format; 4; 1))="A")
										$_t_Format2:=Substring:C12($_t_FirstWord; 4; 1)
										If (($_t_Format2#"A") & ($_t_Format2#"B") & ($_t_Format2#"E") & ($_t_Format2#"H") & ($_t_Format2#"M") & ($_t_Format2#"N") & ($_t_Format2#"P") & ($_t_Format2#"R") & ($_t_Format2#"V") & ($_t_Format2#"W") & ($_t_Format2#"X") & ($_t_Format2#"Y"))
											$0:=False:C215
											If (Count parameters:C259=2)
												$2->:="N"
											End if 
										End if 
									End if 
								End if 
								
								If ($0)
									If (Count parameters:C259=2)
										$2->:="O"
									End if 
									
									If ($_t_FirstWord2#"")
										$_t_Format3:=Check_PC_AN($_t_FirstWord2)
										If (($_t_Format3#"NAA") & ($_t_Format3#"NNN"))
											$0:=False:C215
										Else 
											If (($_t_Format3="NNN") & ($_t_FirstWord#"BFPO"))
												$0:=False:C215
											Else 
												If (($_t_FirstWord2="@C@") | ($_t_FirstWord2="@I@") | ($_t_FirstWord2="@K@") | ($_t_FirstWord2="@M@") | ($_t_FirstWord2="@O@") | ($_t_FirstWord2="@V@"))
													$0:=False:C215
												Else 
													
													If (Count parameters:C259=2)
														$2->:="F"
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
			End if 
			
		End if 
	End if 
Else 
	If (Count parameters:C259=2)
		$2->:="N"
	End if 
End if 
ERR_MethodTrackerReturn("Check Postcode"; $_t_oldMethodName)