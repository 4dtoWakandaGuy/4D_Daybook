//%attributes = {}
If (False:C215)
	//Project Method Name:      DS_CheckNameWithExtension
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 18:09
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; $_l_TestPath)
	C_POINTER:C301($3; $4)
	C_TEXT:C284($_t_Extension; $_t_Filename; $_t_NewPath; $_t_oldMethodName; $0; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DS_CheckNameWithExtension")
//NG March 2004
//This method will check for the existence of a file using different extensions
//Pass the full path with file name in $1(text)
//Pass the file extension in $2
//this will be the file extension extracted already from the file name
//and subtracted from it
//pass a list of valide extensions to check
//this will be used if $2 is empty or does not lead to a file
//$0 will be the NEW file name OR $1

If (Count parameters:C259>=2)
	If ($1#"")
		$_t_Filename:=FileNamefromPath($1)
		$_t_NewPath:=$1
		$_t_Extension:=$2
		
		If (Is macOS:C1572)  // This is a pc
			If ($_t_Extension="")
				If (Count parameters:C259>=3)
					For ($_l_Index; 1; Size of array:C274($3->))
						$_l_TestPath:=Test path name:C476($_t_NewPath+"."+$3->{$_l_Index})
						If ($_l_TestPath=1)
							$_t_NewPath:=$_t_NewPath+"."+$3->{$_l_Index}
							$_t_Filename:=FileNamefromPath($_t_NewPath)
							$_l_Index:=99999999
						End if 
					End for 
				End if 
				
			Else 
				$_l_TestPath:=Test path name:C476($_t_NewPath+"."+$_t_Extension)
				If ($_l_TestPath=1)
					$_t_NewPath:=$_t_NewPath+"."+$_t_Extension
					$_t_Filename:=FileNamefromPath($_t_NewPath)
				Else 
					//we could try with different extensions here
				End if 
			End if 
			
		Else 
			
			If ($_t_Extension="")
				//First try the file name without an extension
				$_l_TestPath:=Test path name:C476($_t_NewPath)
				If ($_l_TestPath#1)
					If (Count parameters:C259>=3)
						For ($_l_Index; 1; Size of array:C274($3->))
							$_l_TestPath:=Test path name:C476($_t_NewPath+"."+$3->{$_l_Index})
							If ($_l_TestPath=1)
								$_t_NewPath:=$_t_NewPath+"."+$3->{$_l_Index}
								$_t_Filename:=FileNamefromPath($_t_NewPath)
								$_l_Index:=99999999
							End if 
						End for 
					End if 
					
				End if 
			Else 
				//Try with the extension then without
				$_l_TestPath:=Test path name:C476($_t_NewPath+"."+$_t_Extension)
				If ($_l_TestPath#1)
					//path with proposed extension does not exist
					$_l_TestPath:=Test path name:C476($_t_NewPath)
					If ($_l_TestPath#1)
						//we could try with differenct extensions here
					Else 
						$_t_Filename:=FileNamefromPath($_t_NewPath)
					End if 
					
				Else 
					$_t_NewPath:=$_t_NewPath+"."+$_t_Extension
					$_t_Filename:=FileNamefromPath($_t_NewPath)
				End if 
				
			End if 
			
		End if 
		$0:=$_t_NewPath
		
	End if 
	
End if 
ERR_MethodTrackerReturn("DS_CheckNameWithExtension"; $_t_oldMethodName)