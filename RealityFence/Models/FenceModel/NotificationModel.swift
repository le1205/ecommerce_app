//
//  NotificationModel.swift
//  RealityFence
//
//  Created by Secret on 7/25/23.
//

import Foundation

extension NotificationView {
    
    @MainActor class ViewModel: ObservableObject {
        
        @Published var isLoading: Bool = false
        @Published var errorMessage: String = ""
        @Published var getSuccessful: Bool = false
        
        func getCategories(uData:UserData, fData: FencesData) async {
            let startTime = Date()
            isLoading = true
            defer {
                isLoading = false
            }
            do {
                let data = try await FencesService().category(uData.user_id)
                let endTime = Date() // Measure end time
                let duration = endTime.timeIntervalSince(startTime)
                uData.duration = duration
                uData.msg = data.message
                    getSuccessful = true
                uData.getFences = true
                let convertedCategories = data.data.categories.map { category -> FencesData.Categories in
                            return FencesData.Categories(id: category.id,
                                                     name: category.name,
                                                     images: FencesData.Images(preview: category.images.preview),
                                                     sub_categories: category.sub_categories.map {
                                sub -> FencesData.Styles in return FencesData.Styles(
                                    title: sub.title,
                                    preview: sub.preview
                                )
                            },
                                                         styles: category.styles.map { style -> FencesData.Styles in
                                return FencesData.Styles(title: style.title,
                                                             preview: style.preview
                                    )
                            },
                                                         colors: category.colors.map { color -> FencesData.Styles in
                                return FencesData.Styles(title: color.title,
                                                         preview: color.preview
                                    )
                            }
                            )
                        }
                let convertedSelected = data.data.selectedFences.map { fence -> FencesData.Fences in
                        return FencesData.Fences(     id: fence.id,
                                                  name: fence.name,
                                                  description: fence.description,
                                                      filesImages: fence.filesImage.map { image -> FencesData.Images in
                                                     return FencesData.Images(preview: image.preview)
                                                 },
                                                      category: fence.category,
                                                      sub_category: fence.sub_category,
                                                      style: fence.style,
                                                      color: fence.color,
                                                      size: fence.size,
                                                      tags: fence.tags
                            )
                        }
                let convertedFavour = data.data.favoriteFences.map { fence -> FencesData.Fences in
                        return FencesData.Fences(id: fence.id,
                                            name: fence.name,
                                            description: fence.description,
                                          filesImages: fence.filesImage.map { image -> FencesData.Images in
                                         return FencesData.Images(preview: image.preview)
                                     },
                                          category: fence.category,
                                          sub_category: fence.sub_category,
                                          style: fence.style,
                                          color: fence.color,
                                          size: fence.size,
                                          tags: fence.tags
                            )
                        }


//                         Initialize new CategoryData instance with the converted categories
                let categoryData = FencesData.CategoryData(category: convertedCategories, selectedFences: convertedSelected, favouriteFences: convertedFavour)
                fData.data = categoryData
            } catch let error {
                if type(of: error) == FencesService.self.FencesError.self {
                    errorMessage = error.localizedDescription
                } else {
                    print("Application error: ", error.localizedDescription)
                    errorMessage = "Connection error"
                }
                getSuccessful = false
            }
        }
    }
}
