package net.minecraft.src;

public class ItemNPCPlacer extends Item {
    public ItemNPCPlacer(int par1) {
        super(par1);
        this.setMaxStackSize(1);
    }
    
    public ItemStack onItemRightClick(ItemStack par1ItemStack, World par2World, EntityPlayer par3EntityPlayer) {
		return par1ItemStack;
	}
}