//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_ProcessMemoryinit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_MemoryInited)
	C_LONGINT:C283(<>K; <>K2; <>K3; <>K4; <>K5; <>K6; $_l_MemoryUnits; $0; $1; DB_l_Memory2; DB_l_Memory3)
	C_LONGINT:C283(DB_l_Memory4; DB_l_Memory5; DB_l_Memory6; DB_l_MemoryBase)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_ProcessMemoryinit")
If (Not:C34(DB_bo_MemoryInited))
	DB_l_MemoryBase:=64000
	
	//DB_l_Memory2:=96000*2
	//DB_l_Memory3:=144000*2
	//DB_l_Memory4:=180000*2
	//DB_l_Memory5:=256000*2
	//DB_l_Memory6:=512000*2
	DB_bo_MemoryInited:=True:C214
	
End if 
If (Count parameters:C259>=1)
	$_l_MemoryUnits:=$1
	If ($_l_MemoryUnits=0)
		$_l_MemoryUnits:=1
	End if 
	$_l_MemoryUnits:=(DB_l_MemoryBase*$_l_MemoryUnits)
	If (False:C215)
		Case of 
			: ($_l_MemoryUnits=1)
				$_l_MemoryUnits:=(DB_l_MemoryBase*1)
			: ($_l_MemoryUnits=2)
				$_l_MemoryUnits:=(DB_l_MemoryBase*2)
			: ($_l_MemoryUnits=3)
				$_l_MemoryUnits:=(DB_l_MemoryBase*3)
			: ($_l_MemoryUnits=3)
				$_l_MemoryUnits:=(DB_l_MemoryBase*4)
			: ($_l_MemoryUnits=4)
				$_l_MemoryUnits:=(DB_l_MemoryBase*6)
			: ($_l_MemoryUnits=5)
				$_l_MemoryUnits:=(DB_l_MemoryBase*8)
			: ($_l_MemoryUnits=6)
				$_l_MemoryUnits:=(DB_l_MemoryBase*16)
			Else 
				$_l_MemoryUnits:=(DB_l_MemoryBase*$_l_MemoryUnits)
		End case 
	End if 
	$0:=($_l_MemoryUnits*2)
	
Else 
	
	<>K:=72000*2
	<>K2:=96000*2
	<>K3:=144000*2
	<>K4:=180000*2
	<>K5:=256000*2
	<>K6:=512000*2
End if 
ERR_MethodTrackerReturn("DB_ProcessMemoryinit"; $_t_oldMethodName)
