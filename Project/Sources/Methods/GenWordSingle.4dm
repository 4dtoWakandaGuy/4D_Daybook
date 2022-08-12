//%attributes = {}
If (False:C215)
	//Project Method Name:      GenWordSingle
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/11/2009 12:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $_t_Word; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("GenWordSingle")

//This is an attempt to take a plural workd and turn it into a single
//Note that this is not intended to cope with all nouns e.g. it has no handling for words like Geese  or children which do not follow normal rules
$0:=""
If (Count parameters:C259>=1)
	$_t_Word:=$1
	If (Length:C16($_t_Word)>0)
		Case of 
			: (Length:C16($_t_Word)=1)
				$0:=$_t_Word
			: (($_t_Word[[Length:C16($_t_Word)]])="s")
				Case of 
					: (($_t_Word[[Length:C16($_t_Word)-1]])="e")
						If (Length:C16($_t_Word)>3)
							Case of 
								: (($_t_Word[[Length:C16($_t_Word)-2]])="i")
									$_t_Word:=Substring:C12($_t_Word; 1; Length:C16($_t_Word)-3)+"y"
								: (($_t_Word[[Length:C16($_t_Word)-2]])="v")
									$_t_Word:=Substring:C12($_t_Word; 1; Length:C16($_t_Word)-3)+"f"
									Case of 
										: ($_t_Word="Knif")
											$_t_Word:="Knife"
										: ($_t_Word="Lif")
											$_t_Word:="Life"
										: ($_t_Word="wif")
											$_t_Word:="wife"
									End case 
								: (($_t_Word[[Length:C16($_t_Word)-2]])="o")
									$_t_Word:=Substring:C12($_t_Word; 1; Length:C16($_t_Word)-2)
									
								Else 
									$_t_Word:=Substring:C12($_t_Word; 1; Length:C16($_t_Word)-1)
							End case 
						Else 
							$_t_Word:=Substring:C12($_t_Word; 1; Length:C16($_t_Word)-1)
						End if 
					Else 
						$0:=$_t_Word
				End case 
				$0:=$_t_Word
		End case 
	Else 
		$0:=$_t_Word
	End if 
End if 
ERR_MethodTrackerReturn("GenWordSingle"; $_t_oldMethodName)