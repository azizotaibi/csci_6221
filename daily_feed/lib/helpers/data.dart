import 'package:daily_feeds/models/countryModel.dart';
import 'package:daily_feeds/models/docsModel.dart';
import 'package:daily_feeds/models/docss.dart';
import 'package:flutter/cupertino.dart';

List<CountryModel> getCountries(){
  List<CountryModel> countries = new List<CountryModel>();
  CountryModel countryModel = new CountryModel();

  countryModel.countryName = "USA";
  countryModel.imageUrl = "https://flagpedia.net/data/flags/w580/us.webp";
  countryModel.searchKeywords = "OR American OR Americans OR United States";
  countries.add(countryModel);

  countryModel = new CountryModel();
  countryModel.countryName = "Brazil";
  countryModel.imageUrl = "https://flagpedia.net/data/flags/w580/br.webp";
  countryModel.searchKeywords = "OR Brazilian OR Brazilians";
  countries.add(countryModel);

      countryModel = new CountryModel();
  countryModel.countryName = "France";
  countryModel.imageUrl = "https://flagpedia.net/data/flags/w580/fr.webp";
  countryModel.searchKeywords = "OR French ";
  countries.add(countryModel);

    countryModel = new CountryModel();
  countryModel.countryName = "Italy";
  countryModel.imageUrl = "https://flagpedia.net/data/flags/w580/it.webp";
  countryModel.searchKeywords = "OR Italian OR Italians";
  countries.add(countryModel);

    countryModel = new CountryModel();
  countryModel.countryName = "China";
  countryModel.imageUrl = "https://flagpedia.net/data/flags/w580/cn.webp";
  countryModel.searchKeywords = "OR Chinese";
  countries.add(countryModel);

    countryModel = new CountryModel();
  countryModel.countryName = "Japan";
  countryModel.imageUrl = "https://flagpedia.net/data/flags/w580/jp.webp";
  countryModel.searchKeywords = "OR Japanese";
  countries.add(countryModel);

      countryModel = new CountryModel();
  countryModel.countryName = "Russia";
  countryModel.imageUrl = "https://flagpedia.net/data/flags/w580/ru.webp";
  countryModel.searchKeywords="OR Russian OR Russians";
  countries.add(countryModel);

      countryModel = new CountryModel();
      countryModel.countryName = "BBC";
  countryModel.searchKeywords = "bbc.com";
  countryModel.imageUrl = "https://is5-ssl.mzstatic.com/image/thumb/Purple113/v4/bf/9f/46/bf9f46b2-1cc3-fb19-1417-08abbc222604/AppIcon-0-0-1x_U007emarketing-0-0-0-10-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/1200x630wa.png";
  countryModel.isSource = true;
  countries.add(countryModel);

        countryModel = new CountryModel();
        countryModel.countryName = "NBC";
  countryModel.searchKeywords = "nbcnews.com";
  countryModel.imageUrl = "https://www.logodesignlove.com/images/sketches/nbc-logo-01.jpg";
  countryModel.isSource = true;
  countries.add(countryModel);

          countryModel = new CountryModel();
          countryModel.countryName = "Fox News";
  countryModel.searchKeywords = "foxnews.com";
  countryModel.imageUrl = "https://is2-ssl.mzstatic.com/image/thumb/Purple123/v4/cc/21/1a/cc211a86-6182-50d8-8d76-8aaafdacbea3/AppIcon-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/1200x630wa.png";
  countryModel.isSource = true;
  countries.add(countryModel);

        countryModel = new CountryModel();
        countryModel.countryName = "NY Post";
  countryModel.searchKeywords = "nypost.com";
  countryModel.imageUrl = "https://lh3.googleusercontent.com/R0sjgW05w9MRrlt_eBLbgMNlPodlY7iL364IPJ7DrawG3I_qGzIWSST3hNVFiSzs6VA";
  countryModel.isSource = true;
  countries.add(countryModel);

          countryModel = new CountryModel();
          countryModel.countryName = "CNN";
  countryModel.searchKeywords = "cnn.com";
  countryModel.imageUrl = "https://is5-ssl.mzstatic.com/image/thumb/Purple123/v4/a4/dc/a0/a4dca0c0-119f-dff0-9c27-88ef7be19db9/AppIcon-0-0-1x_U007emarketing-0-0-0-6-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/1200x630wa.png";
  countryModel.isSource = true;
  countries.add(countryModel);

            countryModel = new CountryModel();
            countryModel.countryName = "NPR";
  countryModel.searchKeywords = "npr.org";
  countryModel.imageUrl = "https://is3-ssl.mzstatic.com/image/thumb/Purple7/v4/85/fe/f1/85fef1a4-3af7-0f09-4896-d3d2ff46485c/mzl.qdhsbdux.png/1200x630wa.png";
  countryModel.isSource = true;
  countries.add(countryModel);

              countryModel = new CountryModel();
              countryModel.countryName = "Huffpost";
  countryModel.searchKeywords = "huffpost.com";
  countryModel.imageUrl = "https://is4-ssl.mzstatic.com/image/thumb/Purple113/v4/d2/ac/c8/d2acc8fc-0422-1e6c-c219-6d2f8ee75769/AppIcon-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/1200x630wa.png";
  countryModel.isSource = true;
  countries.add(countryModel);

                countryModel = new CountryModel();
                countryModel.countryName = "Breitbart";
  countryModel.searchKeywords = "breitbart.com";
  countryModel.imageUrl = "https://is2-ssl.mzstatic.com/image/thumb/Purple113/v4/d4/08/43/d4084369-e788-451d-319b-ea11a79ae8e7/AppIcon-1x_U007emarketing-0-7-0-0-85-220.png/1200x630wa.png";
  countryModel.isSource = true;
  countries.add(countryModel);

                  countryModel = new CountryModel();
                  countryModel.countryName = "USA Today";
  countryModel.searchKeywords = "usatoday.com";
  countryModel.imageUrl = "https://is5-ssl.mzstatic.com/image/thumb/Purple123/v4/0b/34/90/0b34900e-f715-3ae6-1c65-2df4f903684e/AppIcon-0-0-1x_U007emarketing-0-0-0-6-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/1200x630wa.png";
  countryModel.isSource = true;
  countries.add(countryModel);

                    countryModel = new CountryModel();
                  countryModel.countryName = "Reuters";
  countryModel.searchKeywords = "reuters.com";
  countryModel.imageUrl = "https://is3-ssl.mzstatic.com/image/thumb/Purple123/v4/ec/af/09/ecaf09d4-6a37-2b36-4e46-f9dc1b041602/AppIcon-0-1x_U007emarketing-0-0-GLES2_U002c0-512MB-sRGB-0-0-0-85-220-0-0-0-7.png/1200x630wa.png";
  countryModel.isSource = true;
  countries.add(countryModel);

  return countries;
}


List<Docs> getDocuments() {
    
    List<Docs> docs=[];
    docs.add(Docs("https://flagpedia.net/data/flags/w580/sa.webp", "Arabic", "This document from CDC ","https://www.cdc.gov/coronavirus/2019-ncov/downloads/sick-with-2019-nCoV-fact-sheet-arabic.pdf"));
    docs.add(Docs("https://flagpedia.net/data/flags/w580/cn.webp", "Chinese", "This document from CDC ","https://www.cdc.gov/coronavirus/2019-ncov/downloads/sick-with-2019-nCoV-fact-sheet-chinese.pdf"));
    docs.add(Docs("https://flagpedia.net/data/flags/w580/us.webp", "English", "This document from CDC ","https://www.cdc.gov/coronavirus/2019-ncov/downloads/sick-with-2019-nCoV-fact-sheet.pdf"));
    docs.add(Docs("https://flagpedia.net/data/flags/w580/ir.webp", "Farsi", "This document from CDC ","https://www.cdc.gov/coronavirus/2019-ncov/downloads/sick-with-2019-nCoV-fact-sheet-farsi.pdf"));
    docs.add(Docs("https://flagpedia.net/data/flags/w580/fr.webp", "French", "This document from CDC ","https://www.cdc.gov/coronavirus/2019-ncov/downloads/sick-with-2019-nCoV-fact-sheet-french.pdf"));
    docs.add(Docs("https://flagpedia.net/data/flags/w580/ru.webp", "Russian", "This document from CDC ","https://www.cdc.gov/coronavirus/2019-ncov/downloads/sick-with-2019-nCoV-fact-sheet-russian.pdf"));



    return docs;
}