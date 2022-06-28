public class ImageFactory {
  ImageConfig defaultconfig;
  
  ImageFactory(){
    defaultconfig = new ImageConfig("sunset.jpg", 576, 432);
  }
  
  ImageConfig GetSunset() {
    return new ImageConfig("sunset.jpg", 576, 432);
  }
  
  ImageConfig GetVanGogh1() {
    return new ImageConfig("vg1.jpg", 833, 1000);
  }
  
  ImageConfig GetVanGogh2() {
    return new ImageConfig("vg2.png", 395, 474);
  }
  
  ImageConfig GetCustom(String imageName) {
    ImageConfig config = defaultconfig;
    config.SetName(imageName);
    return config;
  }
}
