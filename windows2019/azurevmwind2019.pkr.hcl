source "azure-arm" "windowsimage-2019" {
  #Tags
  azure_tags = {
    environment = "dev"
    owner       = "Phaneendra_r"
    email       = "v-pratnakara@microsoft.com"
    purpose     = "Infra Deployment"
    task        = "packerimages"
    status      = ""
  }

  ##Source Images details###
  os_type         = "Windows"
  image_offer     = "WindowsServer"
  image_publisher = "MicrosoftWindowsServer"
  image_sku       = "2019-datacenter-gensecond"
  vm_size         = "Standard_D2s_v3"
  communicator    = "winrm"
  winrm_use_ssl   = true
  winrm_timeout   = "10m"
  winrm_insecure  = true
  winrm_username  = "packer"
  temp_compute_name = "win2019-vm-poc"
  temp_nic_name     = "win2019-nic-poc"
  build_resource_group_name = "test-aib-rg"
  temp_os_disk_name  = "win2019-osdisk-poc"
  location = "West US"
  

  #Define the network 
  virtual_network_resource_group_name = "rg-packer-acg"
  virtual_network_name                = "Packerpoc-vnet"
  virtual_network_subnet_name         = "default"
  #shared_gallery_image_version_end_of_life_date = "2025-03-03T20:00:05.99Z"
  #shared_gallery_image_version_exclude_from_latest  = true


  ### Build Image publish to Target Azure compute galleries###
  shared_image_gallery_destination {
    subscription   = "1901eaa9-e98f-49b6-ac39-b1cd55defe19"
    gallery_name   = "AzurepackerImages"
    image_name     = "win2019dcx64"
    #image_version  = "${formatdate("YYYY.MMDD.hhmm", timestamp())}"
    image_version  = "1.0.0"
    resource_group = "rg-packer-acg"
  }
}