//
//  GallerySDK.swift
//  GallerySDK
//

import Foundation

public struct Gallery {
  let name: String?
  let photoUrls: [String]
}

public final class GallerySDK {

  public static func fetchData(completion: @escaping ([Gallery]) -> ()) {
    DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 4) {
      let galeries = [
        Gallery(
          name: "Gallery 1",
          photoUrls:
            [
              "https://i.picsum.photos/id/525/400/600.jpg?hmac=_zlzIkPg3CNYPTetyB8vL7b-P9L6ewiA9JPm7zOdnpo",
              "https://i.picsum.photos/id/813/400/600.jpg?hmac=r6ECo81hAQVvDEU1kPDzMXDtcbFESDW5BhGo7Hr09IM",
              "https://i.picsum.photos/id/620/400/600.jpg?hmac=JTtpWi0WE4iY58SEBrL0UmYvsnM2BlX_vO9mZ--FKi8"
            ]
        ),
        Gallery(
          name: nil,
          photoUrls:
            [
              "https://i.picsum.photos/id/525/400/600.jpg?hmac=_zlzIkPg3CNYPTetyB8vL7b-P9L6ewiA9JPm7zOdnpo",
              "https://i.picsum.photos/id/813/400/600.jpg?hmac=r6ECo81hAQVvDEU1kPDzMXDtcbFESDW5BhGo7Hr09IM",
              "https://i.picsum.photos/id/620/400/600.jpg?hmac=JTtpWi0WE4iY58SEBrL0UmYvsnM2BlX_vO9mZ--FKi8"
            ]
        ),
        Gallery(
          name: "Gallery 2",
          photoUrls:
            [
              "https://i.picsum.photos/id/700/400/600.jpg?hmac=yRfyyFLHkStyTh-W7-Fn8zUyo2CsA9JMTK-yaFPZM_k",
              "https://i.picsum.photos/id/737/400/600.jpg?hmac=IPiUHLs2hLTN2WwhSqH19-HMNlNcTkn7AwIcs3COtcQ",
            ]
        ),
        Gallery(
          name: "Gallery 3",
          photoUrls: ["https://i.picsum.photos/id/259/400/600.jpg?hmac=6QvQpG7hZ4TweouYskbZ6qniH7LgZLFi7TyibSBiRdg"]
        ),
        Gallery(
          name: "Gallery 4",
          photoUrls:
            [
              "https://i.picsum.photos/id/122/400/600.jpg?hmac=XdvLbXlZNsH--URsnb7nW95ziWv6JgYDRf0aDrv6WT0",
              "https://i.picsum.photos/id/966/400/600.jpg?hmac=3TAOWcFSyZCm7CN5Uy0Zo5dBhfu-afNd21JfOJKrThc",
              "https://i.picsum.photos/id/727/400/600.jpg?hmac=vtgH-HPl5BJ2gxkoPbWto-6rYNHjNmco40yd-8uqhNQ",
              "https://i.picsum.photos/id/424/400/600.jpg?hmac=J1Ds8ty1I5tZHmKOTk50cT8jk8CW-VZyExJ-a_nTjkg"
            ]
        ),
        Gallery(
          name: "Gallery 5",
          photoUrls: []
        ),
        Gallery(
          name: "Long Gallery",
          photoUrls:
            [
              "https://i.picsum.photos/id/516/400/600.jpg?hmac=ap61McvhUgqpZIxbkNldeEPrhBMbGgE_JG8wc1qzuko",
              "https://i.picsum.photos/id/966/400/600.jpg?hmac=3TAOWcFSyZCm7CN5Uy0Zo5dBhfu-afNd21JfOJKrThc",
              "https://i.picsum.photos/id/317/400/600.jpg?hmac=ZYJeqayk8DGVIa5eFi2s9k-SKUcX3IqKRB7ny_R-110",
              "https://i.picsum.photos/id/727/400/600.jpg?hmac=vtgH-HPl5BJ2gxkoPbWto-6rYNHjNmco40yd-8uqhNQ",
              "https://i.picsum.photos/id/869/400/600.jpg?hmac=p6u7xDA3BXia2OpCZt6qt2pVpkoMSEQ5POw5BjOSRX8",
              "https://i.picsum.photos/id/424/400/600.jpg?hmac=J1Ds8ty1I5tZHmKOTk50cT8jk8CW-VZyExJ-a_nTjkg",
              "https://i.picsum.photos/id/381/400/600.jpg?hmac=FDqAdeC31dU7VM5HCL9rRsbA-HY6P0w9vL_B_vD5oDU",
              "https://i.picsum.photos/id/256/400/600.jpg?hmac=uI75Vh0kgFWDIrbYUEuW4dCOqwGH7dHHVagTi1OT-uY"
            ]
        ),
        Gallery(
          name: "Test",
          photoUrls:
            [
              "https://i.picsum.photos/id/122/400/600.jpg?hmac=XdvLbXlZNsH--URsnb7nW95ziWv6JgYDRf0aDrv6WT0",
            ]
        ),
        Gallery(
          name: nil,
          photoUrls:
            [
              "https://i.picsum.photos/id/122/400/600.jpg?hmac=XdvLbXlZNsH--URsnb7nW95ziWv6JgYDRf0aDrv6WT0",
              "https://i.picsum.photos/id/966/400/600.jpg?hmac=3TAOWcFSyZCm7CN5Uy0Zo5dBhfu-afNd21JfOJKrThc",
              "https://i.picsum.photos/id/727/400/600.jpg?hmac=vtgH-HPl5BJ2gxkoPbWto-6rYNHjNmco40yd-8uqhNQ",
              "https://i.picsum.photos/id/424/400/600.jpg?hmac=J1Ds8ty1I5tZHmKOTk50cT8jk8CW-VZyExJ-a_nTjkg"
            ]
        ),
        Gallery(
          name: "This gallery has a very long name, this could be a problem",
          photoUrls:
            [
              "https://i.picsum.photos/id/393/400/600.jpg?hmac=X_Q6NjnB21i7xFTm_P3t3XAMnycQ4wr14Mi08y3jtrw",
              "https://i.picsum.photos/id/869/400/600.jpg?hmac=p6u7xDA3BXia2OpCZt6qt2pVpkoMSEQ5POw5BjOSRX8"
            ]
        ),
        Gallery(
          name: "",
          photoUrls:
            [
              "https://i.picsum.photos/id/122/400/600.jpg?hmac=XdvLbXlZNsH--URsnb7nW95ziWv6JgYDRf0aDrv6WT0",
              "https://i.picsum.photos/id/966/400/600.jpg?hmac=3TAOWcFSyZCm7CN5Uy0Zo5dBhfu-afNd21JfOJKrThc",
              "https://i.picsum.photos/id/727/400/600.jpg?hmac=vtgH-HPl5BJ2gxkoPbWto-6rYNHjNmco40yd-8uqhNQ",
              "https://i.picsum.photos/id/424/400/600.jpg?hmac=J1Ds8ty1I5tZHmKOTk50cT8jk8CW-VZyExJ-a_nTjkg"
            ]
        ),
        Gallery(
          name: "Gallery 123",
          photoUrls:
            [
              "https://i.picsum.photos/id/122/400/600.jpg?hmac=XdvLbXlZNsH--URsnb7nW95ziWv6JgYDRf0aDrv6WT0",
              "https://i.picsum.photos/id/966/400/600.jpg?hmac=3TAOWcFSyZCm7CN5Uy0Zo5dBhfu-afNd21JfOJKrThc",
              "https://i.picsum.photos/id/727/400/600.jpg?hmac=vtgH-HPl5BJ2gxkoPbWto-6rYNHjNmco40yd-8uqhNQ",
              "https://i.picsum.photos/id/424/400/600.jpg?hmac=J1Ds8ty1I5tZHmKOTk50cT8jk8CW-VZyExJ-a_nTjkg"
            ]
        ),
        Gallery(
          name: "Gallery",
          photoUrls:
            [
              "https://i.picsum.photos/id/256/400/600.jpg?hmac=uI75Vh0kgFWDIrbYUEuW4dCOqwGH7dHHVagTi1OT-uY",
              "https://i.picsum.photos/id/966/400/600.jpg?hmac=3TAOWcFSyZCm7CN5Uy0Zo5dBhfu-afNd21JfOJKrThc",
              "https://i.picsum.photos/id/256/400/600.jpg?hmac=uI75Vh0kgFWDIrbYUEuW4dCOqwGH7dHHVagTi1OT-uY",
              "https://i.picsum.photos/id/424/400/600.jpg?hmac=J1Ds8ty1I5tZHmKOTk50cT8jk8CW-VZyExJ-a_nTjkg"
            ]
        ),
        Gallery(
          name: "Empty",
          photoUrls:
            []
        ),
        Gallery(
          name: "",
          photoUrls:
            [
              "https://i.picsum.photos/id/122/400/600.jpg?hmac=XdvLbXlZNsH--URsnb7nW95ziWv6JgYDRf0aDrv6WT0",
              "https://i.picsum.photos/id/966/400/600.jpg?hmac=3TAOWcFSyZCm7CN5Uy0Zo5dBhfu-afNd21JfOJKrThc",
              "https://i.picsum.photos/id/727/400/600.jpg?hmac=vtgH-HPl5BJ2gxkoPbWto-6rYNHjNmco40yd-8uqhNQ",
              "https://i.picsum.photos/id/424/400/600.jpg?hmac=J1Ds8ty1I5tZHmKOTk50cT8jk8CW-VZyExJ-a_nTjkg"
            ]
        ),
        Gallery(
          name: "Gallery 10",
          photoUrls:
            [
              "https://i.picsum.photos/id/130/400/600.jpg?hmac=Sjd4l6mHudp1jvwIZ3NEkmhTKqpvaswYCjsuSo6sLiU",
              "https://i.picsum.photos/id/966/400/600.jpg?hmac=3TAOWcFSyZCm7CN5Uy0Zo5dBhfu-afNd21JfOJKrThc",
            ]
        ),

        Gallery(
          name: "Gallery 11",
          photoUrls:
            [
              "https://i.picsum.photos/id/317/400/600.jpg?hmac=ZYJeqayk8DGVIa5eFi2s9k-SKUcX3IqKRB7ny_R-110",
              "https://i.picsum.photos/id/424/400/600.jpg?hmac=J1Ds8ty1I5tZHmKOTk50cT8jk8CW-VZyExJ-a_nTjkg"
            ]
        ),
        Gallery(
          name: "Gallery 12",
          photoUrls:
            [
              "https://i.picsum.photos/id/424/400/600.jpg?hmac=J1Ds8ty1I5tZHmKOTk50cT8jk8CW-VZyExJ-a_nTjkg"
            ]
        ),
        Gallery(
          name: "Gallery 321",
          photoUrls:
            [
              "https://i.picsum.photos/id/694/400/600.jpg?hmac=lKkl78L9Lb2Mw4DJ2f-Yw4gyYt1cbQObNszqiAJto4E",
            ]
        ),
        Gallery(
          name: "Test 4",
          photoUrls:
            [
              "https://i.picsum.photos/id/727/400/600.jpg?hmac=vtgH-HPl5BJ2gxkoPbWto-6rYNHjNmco40yd-8uqhNQ",
              "https://i.picsum.photos/id/664/400/600.jpg?hmac=qQWZ5ZFwtxUASwfM1W8nJbsAETutm61MxcUOb-9ANq8"
            ]
        ),
        Gallery(
          name: "1",
          photoUrls:
            [
              "https://i.picsum.photos/id/516/400/600.jpg?hmac=ap61McvhUgqpZIxbkNldeEPrhBMbGgE_JG8wc1qzuko",
              "https://i.picsum.photos/id/122/400/600.jpg?hmac=XdvLbXlZNsH--URsnb7nW95ziWv6JgYDRf0aDrv6WT0",
              "https://i.picsum.photos/id/727/400/600.jpg?hmac=vtgH-HPl5BJ2gxkoPbWto-6rYNHjNmco40yd-8uqhNQ",
              "https://i.picsum.photos/id/424/400/600.jpg?hmac=J1Ds8ty1I5tZHmKOTk50cT8jk8CW-VZyExJ-a_nTjkg"
            ]
        ),
        Gallery(
          name: "14",
          photoUrls:
            [
              "https://i.picsum.photos/id/432/400/600.jpg?hmac=Aa_E2DJhb40VGRoKBMYfPaLl7ZEQ9NIw__IAhH7rcrY",
              "https://i.picsum.photos/id/3/400/600.jpg?hmac=eTBgkr-PnswHA4gK0_tLclt_QKHZH6f40zEiqpS2boY",
              "https://i.picsum.photos/id/272/400/600.jpg?hmac=lei5syG18ksGzJPFrmjquXY1vjX2HDx88hlTtnrJ5wY",
              "https://i.picsum.photos/id/593/400/600.jpg?hmac=-VVTh2raXtLHEVF1sKjOABa4ssNm3uP_457gVN5L7gw"
            ]
        ),
        Gallery(
          name: "G1",
          photoUrls:
            [
              "https://i.picsum.photos/id/411/400/600.jpg?hmac=DNMwyFhZmnlvkyjcKw1usMQoy8wUBt1XCLQdyuQAYMc",
              "https://i.picsum.photos/id/727/400/600.jpg?hmac=vtgH-HPl5BJ2gxkoPbWto-6rYNHjNmco40yd-8uqhNQ",
              "https://i.picsum.photos/id/424/400/600.jpg?hmac=J1Ds8ty1I5tZHmKOTk50cT8jk8CW-VZyExJ-a_nTjkg"
            ]
        ),
        Gallery(
          name: "G2",
          photoUrls:
            [
              "https://i.picsum.photos/id/557/400/600.jpg?hmac=HfIatlVh3ehh9LgFv25Z9VcEOXVgGHxKRKdxzJJga4I",
              "https://i.picsum.photos/id/670/400/600.jpg?hmac=G5vS5HjIaH98sYYaoio74bek9uLeeSftLVtymczrzOk"
            ]
        ),
        Gallery(
          name: "G3",
          photoUrls:
            [
              "https://i.picsum.photos/id/432/400/600.jpg?hmac=Aa_E2DJhb40VGRoKBMYfPaLl7ZEQ9NIw__IAhH7rcrY"
            ]
        ),
        Gallery(
          name: "G4",
          photoUrls:
            [
              "https://i.picsum.photos/id/816/400/600.jpg?hmac=6tq2qUZ5QllbKiv-TUqonrqHNY7jBKoRfLDRmlvQprQ",
              "https://i.picsum.photos/id/909/400/600.jpg?hmac=JaPJ4DfDDVvOEO5cB1LTjbB7s0xWgJJTaTcMMDNZl70",
              "https://i.picsum.photos/id/911/400/600.jpg?hmac=n9EGFevw1uQj0QZI8JuDCFDmwsJJkKwdT5sF_RmXtj8",
              "https://i.picsum.photos/id/60/400/600.jpg?hmac=GjN_nWJ1s-fzGy9paNQh4mimzyGnt8T9snCGiFAYlc8"
            ]
        ),
      ]
      completion(galeries)
    }
  }
}
