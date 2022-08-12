//%attributes = {}
If (False:C215)
	//Project Method Name:      INT_GetDock
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/09/2009 12:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(vAlreadyCheckedDockPos; WIN_bo_CheckedALL; WIN_bo_CheckedBottom; WIN_bo_CheckedLeft; WIN_bo_CheckedRight)
	C_LONGINT:C283($_l_CharacterPosition; $_l_Index; $0; WIN_l_DockLB; WIN_l_DockLL; WIN_l_DockLR)
	C_POINTER:C301($2; $3; $4)
	C_REAL:C285($_l_osVersionNum)
	C_TEXT:C284($_t_Command; $_t_Error; $_t_In; $_t_OldMethodName; $_t_Orientation; $_t_osVersionNum; $_t_osVersionNumTEST; $_t_Out; $_t_PlatformOS; $_t_Size; $1)
End if 
//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("INT_GetDock")
//NG November 2006. This method returns the dock postion(on OSX) relevant to the postion we want to know about
//Pass L R or B in $1 and you will get the numbere of pixels to allow from the L R OR B of the screen:)
//Note that this is an OSX thing

//So
//are we using tiger?
//```


$0:=0
If (True:C214)
	If (Count parameters:C259>=1)
		If (Is macOS:C1572)
			
			If (($1="A") & (WIN_bo_CheckedALL=False:C215)) | (($1="B") & (WIN_bo_CheckedBottom=False:C215)) | (($1="L") & (WIN_bo_CheckedRight=False:C215)) | (($1="R") & (WIN_bo_CheckedLeft=False:C215))  //if request is for a dock pos that hasn't been asked for yet
				vAlreadyCheckedDockPos:=True:C214
				
				$_t_PlatformOS:=DBGetOSVersion
				$_l_CharacterPosition:=Position:C15("MacOS"; $_t_PlatformOS)
				If ($_l_CharacterPosition>0) | (Position:C15("Mac OS"; $_t_PlatformOS)>0)
					For ($_l_Index; 1; Length:C16($_t_PlatformOS))
						If ((Character code:C91($_t_PlatformOS[[$_l_Index]])>=48) & (Character code:C91($_t_PlatformOS[[$_l_Index]])<=57))
							$_t_osVersionNumTEST:=$_t_osVersionNum+$_t_PlatformOS[[$_l_Index]]
							If (String:C10(Num:C11($_t_osVersionNumTEST))=$_t_osVersionNumTEST)
								$_t_osVersionNum:=$_t_osVersionNumTEST
							Else 
								$_l_Index:=Length:C16($_t_PlatformOS)+1
							End if 
						End if 
						If ($_l_Index<Length:C16($_t_PlatformOS))
							If (Character code:C91($_t_PlatformOS[[$_l_Index]])=46)
								If ($_t_osVersionNum#"")
									$_t_osVersionNum:=$_t_osVersionNum+$_t_PlatformOS[[$_l_Index]]
								End if 
							End if 
						End if 
						
					End for 
					If ($_t_osVersionNum[[Length:C16($_t_osVersionNum)]]=".")
						$_t_osVersionNum:=Substring:C12($_t_osVersionNum; 1; Length:C16($_t_osVersionNum)-1)
					End if 
					
					//NG-at the moment i am returning 0 unless it is on the right because the dock 'size' is not that near reality
					
					$_l_osVersionNum:=Num:C11($_t_osVersionNum)
					If (True:C214)
						//($_l_osVersionNum>=10.4) | ($_l_osVersionNum>=10.1)  // This is tiger and up
						
						//```
						
						//First we need the dock orientation
						
						
						$_t_Command:="defaults read com.apple.dock orientation"
						$_t_In:=""
						$_t_Out:=""
						$_t_Error:=""
						LAUNCH EXTERNAL PROCESS:C811($_t_Command; $_t_In; $_t_Out; $_t_Error)
						If ($_t_Error#"")
							OK:=1
							$_t_Orientation:="bottom"
						Else 
							If ($_t_Out#"")
								$_t_Orientation:=Replace string:C233($_t_Out; Char:C90(Line feed:K15:40); "")  //remove line feed character
							Else 
								$_t_Orientation:="bottom"
							End if 
						End if 
						
						//$_t_Orientation will be one of the following: bottom, left, right
						
						Case of 
							: ($1="A") & (Count parameters:C259>=4)
								$_t_Command:="defaults read com.apple.dock tilesize"
								LAUNCH EXTERNAL PROCESS:C811($_t_Command; $_t_In; $_t_Out; $_t_Error)
								If ($_t_Out#"")
									$_t_Size:=Replace string:C233($_t_Out; Char:C90(Line feed:K15:40); "")  //remove line feed character
								Else 
									$_t_Size:="0"
								End if 
								$0:=0
								Case of 
									: ($_t_Orientation="Bottom")
										$3->:=0
										$4->:=0
										$2->:=(Num:C11($_t_Size))
										
									: ($_t_Orientation="Left")
										$3->:=0
										$2->:=0
										$4->:=(Num:C11($_t_Size))
										
									: ($_t_Orientation="Right")
										$3->:=0
										$4->:=0
										$3->:=(Num:C11($_t_Size))
										
										
								End case 
							: ($_t_Orientation="Bottom") & ($1="B")
								$_t_Command:="defaults read com.apple.dock tilesize"
								LAUNCH EXTERNAL PROCESS:C811($_t_Command; $_t_In; $_t_Out; $_t_Error)
								If ($_t_Out#"")
									$_t_Size:=Replace string:C233($_t_Out; Char:C90(Line feed:K15:40); "")  //remove line feed character
								Else 
									$_t_Size:="0"
								End if 
								$0:=Num:C11($_t_Size)
								//$0:=0
							: ($_t_Orientation="Left") & ($1="L")
								$_t_Command:="defaults read com.apple.dock tilesize"
								LAUNCH EXTERNAL PROCESS:C811($_t_Command; $_t_In; $_t_Out; $_t_Error)
								If ($_t_Out#"")
									$_t_Size:=Replace string:C233($_t_Out; Char:C90(Line feed:K15:40); "")  //remove line feed character
								Else 
									$_t_Size:="0"
								End if 
								//$0:=Num($_t_Size)+10
								$0:=0
							: ($_t_Orientation="Right") & ($1="R")
								$_t_Command:="defaults read com.apple.dock tilesize"
								LAUNCH EXTERNAL PROCESS:C811($_t_Command; $_t_In; $_t_Out; $_t_Error)
								If ($_t_Out#"")
									$_t_Size:=Replace string:C233($_t_Out; Char:C90(Line feed:K15:40); "")  //remove line feed character
								Else 
									$_t_Size:="0"
								End if 
								$0:=Num:C11($_t_Size)+10
							Else 
								$0:=0  //no allowance required
						End case 
					Else 
						//this is not tiger
						$0:=0
						
					End if 
					
					//Other useful properties of the Apple Dock include:
					
					//'autohide' returns 0 or 1(off/on)
					
					//'magnification' returns 0 or 1(off/on)
					
					//'tilesize' returns the size of the Dock icons when not magnified as a floating p
					
					//'largesize' returns the Dock icon size when magnified as a floating point number
					
					//One caveat: the actual size of the Dock icons in normal state(not magnified)can be smaller than the 'tilesize' property indicates, since the Dock may shrink
					
					
					Case of 
						: (Count parameters:C259>=4) & ($1="A")
							WIN_bo_CheckedALL:=True:C214
							WIN_l_DockLB:=$2->
							WIN_l_DockLR:=$3->
							WIN_l_DockLL:=$4->
						Else 
							Case of 
								: ($1="B")
									WIN_bo_CheckedBottom:=True:C214
									WIN_l_DockLB:=$0
								: ($1="L")
									WIN_bo_CheckedLeft:=True:C214
									WIN_l_DockLL:=$0
								: ($1="R")
									WIN_bo_CheckedRight:=True:C214
									WIN_l_DockLR:=$0
							End case 
					End case 
				Else 
					$0:=0
					//This is wintel..wanna handle this?
				End if 
				
				Case of 
					: (Count parameters:C259>=4) & ($1="A")
						$0:=0
						$2->:=WIN_l_DockLB
						$3->:=WIN_l_DockLR
						$4->:=WIN_l_DockLL
					Else 
						Case of 
							: ($1="B")
								$0:=WIN_l_DockLB
							: ($1="L")
								$0:=WIN_l_DockLL
							: ($1="R")
								$0:=WIN_l_DockLR
						End case 
				End case 
			End if 
		Else 
			//WIndows
			If (($1="A") & (WIN_bo_CheckedALL=False:C215)) | (($1="B") & (WIN_bo_CheckedBottom=False:C215)) | (($1="L") & (WIN_bo_CheckedRight=False:C215)) | (($1="R") & (WIN_bo_CheckedLeft=False:C215))  //if request is for a dock pos that hasn't been asked for yet
				
				$0:=60
				
				Case of 
					: (Count parameters:C259>=4) & ($1="A")
						WIN_bo_CheckedALL:=True:C214
						WIN_l_DockLB:=$2->
						WIN_l_DockLR:=$3->
						WIN_l_DockLL:=$4->
					Else 
						Case of 
							: ($1="B")
								WIN_bo_CheckedBottom:=True:C214
								WIN_l_DockLB:=$0
							: ($1="L")
								WIN_bo_CheckedLeft:=True:C214
								WIN_l_DockLL:=$0
							: ($1="R")
								WIN_bo_CheckedRight:=True:C214
								WIN_l_DockLR:=$0
						End case 
				End case 
			Else   //Already called INT_getDock once from this process so to save on system calls - use the values that we stored away in process vars (NOTE: this means individual processes aren't aware of changes to dock position (usually they learn it when the process first opens a window but if the same process opens any other windows later these will not know about change in dock position)
				Case of 
					: (Count parameters:C259>=4) & ($1="A")
						$0:=0
						$2->:=WIN_l_DockLB
						$3->:=WIN_l_DockLR
						$4->:=WIN_l_DockLL
					Else 
						Case of 
							: ($1="B")
								$0:=WIN_l_DockLB
							: ($1="L")
								$0:=WIN_l_DockLL
							: ($1="R")
								$0:=WIN_l_DockLR
						End case 
				End case 
			End if 
			
			
		End if 
	Else 
		$0:=0
	End if 
Else 
	$0:=0
End if 
ERR_MethodTrackerReturn("INT_GetDock"; $_t_OldMethodName)
