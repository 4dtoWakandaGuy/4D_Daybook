//%attributes = {"invisible":true}

If (False:C215)
	//Project Method Name:      Ver_GetVersionBits
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CountParameters; $_l_Nul; $_l_SlashPosition; $_l_VersionType; $1)
	C_POINTER:C301($_ptr_LicenceVersion; $_ptr_ReleaseType; $_ptr_VersionPart1; $_ptr_VersionPart2; $_ptr_VersionPart3; $_ptr_VersionPart4; $_ptr_VersionPart5; $2; $3; $4; $5)
	C_POINTER:C301($6; $7)
	C_TEXT:C284($_t_DevStageName; $_t_nul; $_t_oldMethodName; $_t_StructureVersionNo; $_t_VersionPart1; $_t_VersionPart2; $_t_VersionPart3; $_t_VersionPart4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Ver_GetVersionBits")
If (False:C215)  // ----------------------------------------------------
	
End if 
$_t_oldMethodName:=ERR_MethodTracker("Ver_GetVersionBits")

$_l_CountParameters:=Count parameters:C259
$_t_nul:=""
$_l_Nul:=0
$_l_VersionType:=0
$_ptr_VersionPart1:=->$_t_nul
$_ptr_VersionPart2:=->$_t_nul
$_ptr_VersionPart3:=->$_t_nul
$_ptr_VersionPart4:=->$_t_nul
$_ptr_VersionPart5:=->$_t_nul
$_ptr_ReleaseType:=->$_l_Nul
If (Count parameters:C259>=7)
	$_ptr_LicenceVersion:=$7
	If (Count parameters:C259>=6)
		$_ptr_ReleaseType:=$6
		If (Count parameters:C259>=5)
			$_ptr_VersionPart4:=$5
			If (Count parameters:C259>=4)
				$_ptr_VersionPart3:=$4
				If (Count parameters:C259>=3)
					$_ptr_VersionPart2:=$3
					
					If (Count parameters:C259>=2)
						$_ptr_VersionPart1:=$2
						If (Count parameters:C259>=1)
							$_l_VersionType:=$1
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
If ($_l_CountParameters>=1)
	$_t_StructureVersionNo:=VER_GetVersion($_l_VersionType)
	$_t_DevStageName:=Substring:C12($_t_StructureVersionNo; 1; 1)
	
	If ($_t_StructureVersionNo#"")
		
		If ($_l_CountParameters>=2)
			
			
			
			$_l_SlashPosition:=Position:C15("."; $_t_StructureVersionNo)
			If ($_l_SlashPosition>0)
				$_t_VersionPart1:=Substring:C12($_t_StructureVersionNo; 2; $_l_SlashPosition-2)
				$_t_StructureVersionNo:=Substring:C12($_t_StructureVersionNo; $_l_SlashPosition+1)
			End if 
			
			$_ptr_VersionPart1->:=$_t_VersionPart1
			
			If ($_l_CountParameters>=3)
				
				
				
				$_l_SlashPosition:=Position:C15("."; $_t_StructureVersionNo)
				If ($_l_SlashPosition>0)
					$_t_VersionPart2:=Substring:C12($_t_StructureVersionNo; 1; $_l_SlashPosition-1)
					$_t_StructureVersionNo:=Substring:C12($_t_StructureVersionNo; $_l_SlashPosition+1)
				End if 
				
				$_ptr_VersionPart2->:=$_t_VersionPart2
				
				If ($_l_CountParameters>=4)
					
					
					
					$_l_SlashPosition:=Position:C15("/"; $_t_StructureVersionNo)
					If ($_l_SlashPosition>0)
						$_t_VersionPart3:=Substring:C12($_t_StructureVersionNo; 1; $_l_SlashPosition-1)
						$_t_StructureVersionNo:=Substring:C12($_t_StructureVersionNo; $_l_SlashPosition+1)
					End if 
					
					$_ptr_VersionPart3->:=$_t_VersionPart3
					
					If ($_l_CountParameters>=5)
						
						
						$_t_VersionPart4:=$_t_StructureVersionNo
						$_ptr_VersionPart4->:=$_t_VersionPart4
					End if 
					
					If ($_l_CountParameters>=6)
						
						Case of 
							: ($_t_DevStageName="d")  // Development
								$_ptr_ReleaseType->:=1
							: ($_t_DevStageName="a")  // alpha
								$_ptr_ReleaseType->:=2
							: ($_t_DevStageName="b")  // beta
								$_ptr_ReleaseType->:=3
							: ($_t_DevStageName="v")  // final
								$_ptr_ReleaseType->:=4
						End case 
					End if 
					
					If ($_l_CountParameters>=7)
						$_ptr_LicenceVersion->:=VER_GetLicenceVersion
					End if 
					
				End if 
			End if 
		End if 
		
		
	End if 
End if 
ERR_MethodTrackerReturn("Ver_GetVersionBits"; $_t_oldMethodName)