package net.minecraft.src;

public class ItemNPCPlacer extends Item {
    public ItemNPCPlacer(int par1) {
        super(par1);
        this.setMaxStackSize(1);
    }
    
    public ItemStack onItemRightClick(ItemStack par1ItemStack, World par2World, EntityPlayer par3EntityPlayer) {
		if (!par2World.isRemote) {
			if (par1ItemStack.getDisplayName().contains("npc:")) {
				par1ItemStack.stackSize = 0;

				EntityVillager npc = new EntityVillager(par2World);
				npc.customLabel = par1ItemStack.getDisplayName().replace("npc:", "");
                npc.dataWatcher.updateObject(20, par1ItemStack.getDisplayName().replace("npc:", ""));
				npc.isNPC = true;

				npc.setLocationAndAngles(par3EntityPlayer.posX, par3EntityPlayer.posY, par3EntityPlayer.posZ, 0, 0);
				par2World.spawnEntityInWorld(npc);
			}
		}

		return par1ItemStack;
	}
}